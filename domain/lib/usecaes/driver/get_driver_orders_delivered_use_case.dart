
import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:domain/entities/client/category_data.dart';
import 'package:domain/repositories/client/category_repository.dart';
import 'package:domain/repositories/driver/driver_order_repository.dart';
import 'package:domain/repositories/restaurant/restaurant_order_repository.dart';

class GetDriverOrdersDeliveredUseCase implements UseCase<DataState<List<OrderData>?>, int> {

  final DriverOrderRepository _driverOrderRepository;
  GetDriverOrdersDeliveredUseCase(this._driverOrderRepository);

  @override
  Future<DataState<List<OrderData>?>> call({int? params}) {
    return _driverOrderRepository.getDriverOrdersDeliveredAction(params);
  }

}