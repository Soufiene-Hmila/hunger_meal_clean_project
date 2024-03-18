
import 'package:core/core.dart';
import 'package:domain/entities/client/meal_data.dart';
import 'package:domain/entities/client/restaurant_data.dart';

abstract class RestaurantRepository {

  Future<DataState<RestaurantData?>> getRestaurantAction(int? params);

  Future<DataState<List<RestaurantData>?>> getRestaurantsAction();

}
