
import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:domain/entities/client/category_data.dart';
import 'package:domain/repositories/client/category_repository.dart';
import 'package:domain/repositories/restaurant/restaurant_order_repository.dart';

class GetRestaurantOrdersRejectedUseCase implements UseCase<DataState<List<OrderData>?>, int> {

  final RestaurantOrderRepository _restaurantOrderRepository;
  GetRestaurantOrdersRejectedUseCase(this._restaurantOrderRepository);

  @override
  Future<DataState<List<OrderData>?>> call({int? params}) {
    return _restaurantOrderRepository.getRestaurantOrdersRejectedAction(params);
  }

}