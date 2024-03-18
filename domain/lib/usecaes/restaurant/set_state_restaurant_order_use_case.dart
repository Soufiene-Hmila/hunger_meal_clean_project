
import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:domain/entities/client/category_data.dart';
import 'package:domain/repositories/client/category_repository.dart';
import 'package:domain/repositories/restaurant/restaurant_order_repository.dart';

class SetStatusRestaurantOrderUseCase implements UseCase<DataState<String?>, StateOrderParams> {

  final RestaurantOrderRepository _restaurantOrderRepository;
  SetStatusRestaurantOrderUseCase(this._restaurantOrderRepository);

  @override
  Future<DataState<String?>> call({StateOrderParams? params}) {
    return _restaurantOrderRepository.setStateRestaurantOrderAction(params);
  }

}