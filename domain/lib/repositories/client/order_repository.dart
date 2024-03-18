
import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:domain/entities/client/category_data.dart';
import 'package:domain/entities/client/login_data.dart';
import 'package:domain/entities/client/meal_data.dart';
import 'package:domain/entities/client/restaurant_data.dart';
import 'package:domain/entities/restaurant/order_data.dart';

abstract class OrderRepository {

  Future<DataState<List<CostData>?>> getCostsAction(CostParams? params);

  Future<DataState<OrderData?>> setCartOrderAction(CartParams? params);

  Future<dynamic> setMealAction(MealData? params);
  Future<dynamic> setQuantityMealAction(QuantityParams? params);

  Future<MealData?> getMealAction(int? params);
  Future<dynamic> deleteMealAction(int? params);


  Future<List<MealData>?> getMealsAction();
  Future<dynamic> deleteMealsAction();

}
