import 'package:core/core.dart';
import 'package:domain/entities/client/restaurant_data.dart';
import 'package:domain/repositories/client/restaurant_repository.dart';

class GetRestaurantUseCase implements UseCase<DataState<RestaurantData?>, int?> {

  final RestaurantRepository _restaurantRepository;
  GetRestaurantUseCase(this._restaurantRepository);

  @override
  Future<DataState<RestaurantData?>> call({int? params}) {
    return _restaurantRepository.getRestaurantAction(params);
  }

}