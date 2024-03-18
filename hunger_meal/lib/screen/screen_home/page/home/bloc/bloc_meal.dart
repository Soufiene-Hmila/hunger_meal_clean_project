
import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class BlocMeal extends Bloc {

  final GetMealsUseCase _getMealsUseCase;
  final GetMealUseCase _getMealUseCase;

  BlocMeal(this._getMealsUseCase, this._getMealUseCase,);

  Stream<DataState<MealData?>> getMealService(int? params) async* {
    final dataState = await _getMealUseCase(params: params);
    if (dataState is DataSuccess && dataState.data != null) {
      yield DataSuccess(dataState.data);
    }
    if (dataState is DataFailed) {
      yield DataFailed(dataState.error);
    }
    if (dataState is DataConnexion) {
      yield DataConnexion(dataState.connexion);
    }
  }

  Stream<DataState<List<MealData>?>> getMealsService() async* {
    final dataState = await _getMealsUseCase();
    if (dataState is DataSuccess && dataState.data != null) {
      yield DataSuccess(dataState.data);
    }
    if (dataState is DataFailed) {
      yield DataFailed(dataState.error);
    }
    if (dataState is DataConnexion) {
      yield DataConnexion(dataState.connexion);
    }
  }

  @override
  void dispose() {

  }

}