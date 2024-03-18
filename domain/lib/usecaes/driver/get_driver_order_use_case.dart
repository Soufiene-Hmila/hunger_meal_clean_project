import 'package:core/core.dart';
import 'package:domain/entities/restaurant/order_data.dart';
import 'package:domain/repositories/driver/driver_order_repository.dart';

class GetDriverOrderUseCase implements UseCase<DataState<OrderData?>, int> {

  final DriverOrderRepository _driverOrderRepository;
  GetDriverOrderUseCase(this._driverOrderRepository);

  @override
  Future<DataState<OrderData?>> call({int? params}) {
    return _driverOrderRepository.getDriverOrderAction(params);
  }

}