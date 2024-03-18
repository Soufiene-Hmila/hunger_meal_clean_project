
import 'package:core/core.dart';
import 'package:domain/domain.dart';


class SetCartUseCase implements UseCase<DataState<OrderData?>, CartParams> {

  final OrderRepository _orderRepository;
  SetCartUseCase(this._orderRepository);

  @override
  Future<DataState<OrderData?>> call({CartParams? params}) {
    return _orderRepository.setCartOrderAction(params);
  }

}