
import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:domain/entities/client/restaurant_data.dart';

class GetRestaurantsUseCase implements UseCaseDefault<DataState<List<RestaurantData>?>> {

  final RestaurantRepository _restaurantRepository;
  GetRestaurantsUseCase(this._restaurantRepository);

  @override
  Future<DataState<List<RestaurantData>?>> call() {
    return _restaurantRepository.getRestaurantsAction();
  }

}