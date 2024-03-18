
import 'package:core/core.dart';
import 'package:domain/domain.dart';


class SetQuantityMealUseCase implements UseCase<dynamic, QuantityParams> {

  final OrderRepository _orderRepository;
  SetQuantityMealUseCase(this._orderRepository);

  @override
  Future<dynamic> call({QuantityParams? params}) {
    return _orderRepository.setQuantityMealAction(params);
  }

}