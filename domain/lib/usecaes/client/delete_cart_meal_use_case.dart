
import 'package:core/core.dart';
import 'package:domain/domain.dart';


class DeleteCartMealUseCase implements UseCase<dynamic, int> {

  final OrderRepository _orderRepository;
  DeleteCartMealUseCase(this._orderRepository);

  @override
  Future<dynamic> call({int? params}) {
    return _orderRepository.deleteMealAction(params);
  }

}