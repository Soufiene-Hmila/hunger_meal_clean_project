
import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class BlocMenu extends Bloc {

  final GetRestaurantCategoriesUseCase _getRestaurantCategoriesUseCase;
  final GetRestaurantMealsUseCase _getRestaurantMealsUseCase;
  final ChangeRestaurantMealStateUseCase _changeRestaurantMealStateUseCase;

  BlocMenu(this._getRestaurantCategoriesUseCase,
      this._getRestaurantMealsUseCase, this._changeRestaurantMealStateUseCase);

  Stream<DataState<List<RestaurantMealData>?>> getRestaurantMealsService(RestaurantOrdersParams? params) async* {
    final dataState = await _getRestaurantMealsUseCase(params: params);
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

  Stream<DataState<List<RestaurantCategoryData>?>> getRestaurantCategoriesService(int? params) async* {
    final dataState = await _getRestaurantCategoriesUseCase(params: params);
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

  Stream<DataState<String?>> changeRestaurantMealStateService(StateParams? params) async* {
    final dataState = await _changeRestaurantMealStateUseCase(params: params);
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