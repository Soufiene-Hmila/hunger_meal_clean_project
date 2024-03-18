import 'package:domain/domain.dart';

abstract class HungerMealDao {

  Future<MealData?> getMeal({int? id});

  Future<List<MealData>?> getAllMeals();

  Future<void> insertMeal({MealData? meal});

  Future<void> updateQuantityMeal({int? id, int? quantity});

  Future<void> deleteMeal({int? id});

}

