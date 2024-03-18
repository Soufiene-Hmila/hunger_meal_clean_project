
import 'package:core/core.dart';
import 'package:domain/entities/restaurant/restaurant_category_data.dart';
import 'package:domain/repositories/restaurant/restaurant_category_repository.dart';

class GetRestaurantCategoriesUseCase implements UseCase<DataState<List<RestaurantCategoryData>?>, int> {

  final RestaurantCategoryRepository _restaurantCategoryRepository;
  GetRestaurantCategoriesUseCase(this._restaurantCategoryRepository);

  @override
  Future<DataState<List<RestaurantCategoryData>?>> call({int? params}) {
    return _restaurantCategoryRepository.getRestaurantCategoriesAction(params);
  }

}