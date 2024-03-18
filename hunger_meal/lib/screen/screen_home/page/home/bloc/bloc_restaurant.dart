
import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class BlocRestaurant extends Bloc {

  final GetRestaurantsUseCase _getRestaurantsUseCase;
  final GetRestaurantUseCase _getRestaurantUseCase;

  BlocRestaurant(this._getRestaurantsUseCase, this._getRestaurantUseCase,);

  Stream<DataState<RestaurantData?>> getRestaurantService(int? params) async* {
    final dataState = await _getRestaurantUseCase(params: params);
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

  Stream<DataState<List<RestaurantData>?>> getRestaurantsService() async* {
    final dataState = await _getRestaurantsUseCase();
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

  Stream<DataState<List<RestaurantData>?>> getRestaurantCategoriesService() async* {
    final dataState = await _getRestaurantsUseCase();
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

  Stream<DataState<List<RestaurantData>?>> getRestaurantMealsService() async* {
    final dataState = await _getRestaurantsUseCase();
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