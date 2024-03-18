import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:domain/repositories/driver/driver_order_repository.dart';

class SetStatusDriverOrderUseCase implements UseCase<DataState<String?>, StateOrderParams> {

  final DriverOrderRepository _driverOrderRepository;
  SetStatusDriverOrderUseCase(this._driverOrderRepository);

  @override
  Future<DataState<String?>> call({StateOrderParams? params}) {
    return _driverOrderRepository.setStateDriverOrderAction(params);
  }

}