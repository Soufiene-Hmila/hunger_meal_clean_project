
import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:domain/entities/client/category_data.dart';
import 'package:domain/entities/client/meal_data.dart';
import 'package:domain/repositories/client/category_repository.dart';
import 'package:domain/repositories/client/meal_repository.dart';

class GetMealUseCase implements UseCase<DataState<MealData?>, int?> {

  final MealRepository _mealRepository;
  GetMealUseCase(this._mealRepository);

  @override
  Future<DataState<MealData?>> call({int? params}) {
    return _mealRepository.getMealAction(params);
  }

}