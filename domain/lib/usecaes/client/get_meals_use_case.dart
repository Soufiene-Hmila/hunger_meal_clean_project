
import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:domain/entities/client/category_data.dart';
import 'package:domain/entities/client/meal_data.dart';
import 'package:domain/repositories/client/category_repository.dart';
import 'package:domain/repositories/client/meal_repository.dart';

class GetMealsUseCase implements UseCaseDefault<DataState<List<MealData>?>> {

  final MealRepository _mealRepository;
  GetMealsUseCase(this._mealRepository);

  @override
  Future<DataState<List<MealData>?>> call() {
    return _mealRepository.getMealsAction();
  }

}