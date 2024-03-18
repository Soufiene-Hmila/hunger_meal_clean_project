
import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:domain/entities/client/category_data.dart';
import 'package:domain/repositories/client/category_repository.dart';
import 'package:domain/repositories/restaurant/restaurant_order_repository.dart';

class GetRestaurantOrderUseCase implements UseCase<DataState<OrderData?>, int> {

  final RestaurantOrderRepository _restaurantOrderRepository;
  GetRestaurantOrderUseCase(this._restaurantOrderRepository);

  @override
  Future<DataState<OrderData?>> call({int? params}) {
    return _restaurantOrderRepository.getRestaurantOrderAction(params);
  }

}