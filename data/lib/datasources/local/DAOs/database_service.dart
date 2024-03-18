import 'package:data/datasources/local/DAOs/hunger_meal_dao.dart';
import 'package:domain/entities/client/meal_data.dart';
import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DataBaseService extends HungerMealDao {

  static final DataBaseService _instance = DataBaseService._internal();

  static Database? _database;

  factory DataBaseService() => _instance;

  DataBaseService._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('hunger_meal.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE meals(
        id INTEGER PRIMARY KEY,
        restaurant_id INTEGER,
        category_id INTEGER,
        name TEXT NULL,
        approved INTEGER,
        price TEXT NULL,
        available INTEGER,
        image TEXT NULL,
        rating TEXT NULL,
        rating_total TEXT NULL,
        rating_number INTEGER,
        description TEXT NULL,
        state TEXT NULL,
        zone_id INTEGER,
        max_supplement INTEGER NULL,
        quantity INTEGER
      )
    ''');

    await db.execute('''
      CREATE TABLE supplements(
        id INTEGER PRIMARY KEY,
        name TEXT NULL,
        meal_id INTEGER,
        price TEXT NULL,
        mandatory INTEGER NULL,
        in_cart INTEGER,
        max INTEGER NULL
      )
    ''');
  }


  @override
  Future<void> insertMeal({MealData? meal}) async {
    final db = await database;
    if (meal != null) {
      await db.transaction((txn) async {
        await txn.insert('meals', meal.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
        meal.supplements?.forEach((supplement) async {
           await txn.insert('supplements', supplement.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
        });
      });
    }
  }

  @override
  Future<void> updateQuantityMeal({int? id, int? quantity}) async {
    final db = await database;
    await db.update('meals', {'quantity': quantity}, where: "id = ?", whereArgs: [id],);
  }

  @override
  Future<void> deleteMeal({int? id}) async {
    final db = await database;
    await db.delete('meals', where: "id = ?", whereArgs: [id],);
    await db.delete('supplements', where: "meal_id = ?", whereArgs: [id],);
  }

  @override
  Future<MealData?> getMeal({int? id}) async {
    final db = await database;

    var queryResult = await db.query('meals', where: "id = ?", whereArgs: [id]);
    if (queryResult.isEmpty) {
      return null;
    }
    var subQueryResult = await db.query('supplements', where: "meal_id = ?", whereArgs: [id]);
    return MealData.fromJson(mergeMaps(queryResult.first, subQueryResult, 'supplements'));
  }

  @override
  Future<List<MealData>?> getAllMeals() async {
    final db = await database;
    var queryResult = await db.query('meals');

    if (queryResult.isNotEmpty) {
      List<Map<String, dynamic>> supplementsList = [];

      for (var query in queryResult) {
        var subQueryResult = await db.query('supplements', where: "meal_id = ?", whereArgs: [query['id']]);
        supplementsList.addAll(subQueryResult);
      }

      List<MealData> mealsList = queryResult.map((query) {
        var supplements = supplementsList.where((supplement) => supplement['meal_id'] == query['id']).toList();
        return MealData.fromJson(mergeMaps(query, supplements, 'supplements'));
      }).toList();
      return mealsList;
    } else {
      return null;
    }
  }

  Map<String, dynamic> mergeMaps(Map<String, dynamic> map1, List<Map<String, dynamic>> map2, String key) {
    Map<String, dynamic> mergedMap = {...map1};
    mergedMap[key] = map2;
    return mergedMap;
  }

}
