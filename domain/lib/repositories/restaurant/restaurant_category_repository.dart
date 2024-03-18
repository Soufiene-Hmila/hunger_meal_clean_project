
import 'package:core/core.dart';
import 'package:domain/entities/restaurant/restaurant_category_data.dart';
import 'package:domain/entities/restaurant/restaurant_meal_data.dart';

abstract class RestaurantCategoryRepository {

  Future<DataState<List<RestaurantCategoryData>?>> getRestaurantCategoriesAction(int? params);

  Future<DataState<List<RestaurantMealData>?>> getRestaurantMealsAction(RestaurantOrdersParams? params);

  Future<DataState<String?>> changeRestaurantMealStateAction(StateParams? params);

}
