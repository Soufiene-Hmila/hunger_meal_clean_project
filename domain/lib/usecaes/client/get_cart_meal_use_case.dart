
import 'package:core/core.dart';
import 'package:domain/domain.dart';


class GetCartMealUseCase implements UseCase<MealData?, int> {

  final OrderRepository _orderRepository;
  GetCartMealUseCase(this._orderRepository);

  @override
  Future<MealData?> call({int? params}) {
    return _orderRepository.getMealAction(params);
  }

}