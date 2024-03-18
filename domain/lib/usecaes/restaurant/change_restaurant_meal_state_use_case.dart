
import 'package:core/core.dart';
import 'package:domain/entities/restaurant/restaurant_category_data.dart';
import 'package:domain/entities/restaurant/restaurant_meal_data.dart';
import 'package:domain/repositories/restaurant/restaurant_category_repository.dart';

class ChangeRestaurantMealStateUseCase implements UseCase<DataState<String?>, StateParams> {

  final RestaurantCategoryRepository _restaurantCategoryRepository;
  ChangeRestaurantMealStateUseCase(this._restaurantCategoryRepository);

  @override
  Future<DataState<String?>> call({StateParams? params}) {
    return _restaurantCategoryRepository.changeRestaurantMealStateAction(params);
  }

}