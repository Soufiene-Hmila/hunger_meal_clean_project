
import 'package:core/core.dart';
import 'package:domain/domain.dart';


class GetCartMealsUseCase implements UseCaseDefault<List<MealData>?> {

  final OrderRepository _orderRepository;
  GetCartMealsUseCase(this._orderRepository);

  @override
  Future<List<MealData>?> call() {
    return _orderRepository.getMealsAction();
  }

}