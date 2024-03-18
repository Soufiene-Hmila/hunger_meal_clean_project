
import 'package:core/core.dart';
import 'package:domain/entities/client/category_data.dart';
import 'package:domain/entities/client/meal_data.dart';
import 'package:domain/entities/client/restaurant_data.dart';
import 'package:domain/entities/restaurant/order_data.dart';

abstract class DriverOrderRepository {

  Future<DataState<List<OrderData>?>> getDriverOrdersAcceptAction(int? params);
  Future<DataState<List<OrderData>?>> getDriverOrdersRejectedAction(int? params);
  Future<DataState<List<OrderData>?>> getDriverOrdersWaitingAction(int? params);
  Future<DataState<List<OrderData>?>> getDriverOrdersDeliveredAction(int? params);

  Future<DataState<OrderData?>> getDriverOrderAction(int? params);

  Future<DataState<String?>> setStateDriverOrderAction(StateOrderParams? params);

}
