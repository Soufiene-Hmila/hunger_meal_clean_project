
import 'package:core/core.dart';
import 'package:domain/domain.dart';


class SetMealUseCase implements UseCase<dynamic, MealData> {

  final OrderRepository _orderRepository;
  SetMealUseCase(this._orderRepository);

  @override
  Future<dynamic> call({MealData? params}) {
    return _orderRepository.setMealAction(params);
  }

}