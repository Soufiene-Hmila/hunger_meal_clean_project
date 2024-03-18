
import 'package:core/core.dart';
import 'package:domain/entities/client/category_data.dart';
import 'package:domain/entities/client/meal_data.dart';
import 'package:domain/entities/client/restaurant_data.dart';
import 'package:domain/entities/restaurant/order_data.dart';

abstract class RestaurantOrderRepository {

  Future<DataState<List<OrderData>?>> getRestaurantOrdersAcceptAction(int? params);
  Future<DataState<List<OrderData>?>> getRestaurantOrdersRejectedAction(int? params);
  Future<DataState<List<OrderData>?>> getRestaurantOrdersWaitingAction(int? params);
  Future<DataState<List<OrderData>?>> getRestaurantOrdersDeliveredAction(int? params);

  Future<DataState<OrderData?>> getRestaurantOrderAction(int? params);

  Future<DataState<String?>> setStateRestaurantOrderAction(StateOrderParams? params);

}
