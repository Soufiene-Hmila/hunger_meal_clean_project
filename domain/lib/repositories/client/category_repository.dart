
import 'package:core/core.dart';
import 'package:domain/entities/client/category_data.dart';
import 'package:domain/entities/client/meal_data.dart';
import 'package:domain/entities/client/restaurant_data.dart';

abstract class CategoryRepository {

  Future<DataState<CategoryData?>> getCategoryAction(int? params);

  Future<DataState<List<CategoryData>?>> getCategoriesAction();

}
