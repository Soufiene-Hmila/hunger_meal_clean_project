
import 'package:core/core.dart';
import 'package:domain/entities/restaurant/restaurant_category_data.dart';
import 'package:domain/entities/restaurant/restaurant_meal_data.dart';
import 'package:domain/repositories/restaurant/restaurant_category_repository.dart';

class GetRestaurantMealsUseCase implements UseCase<DataState<List<RestaurantMealData>?>, RestaurantOrdersParams> {

  final RestaurantCategoryRepository _restaurantCategoryRepository;
  GetRestaurantMealsUseCase(this._restaurantCategoryRepository);

  @override
  Future<DataState<List<RestaurantMealData>?>> call({RestaurantOrdersParams? params}) {
    return _restaurantCategoryRepository.getRestaurantMealsAction(params);
  }

}