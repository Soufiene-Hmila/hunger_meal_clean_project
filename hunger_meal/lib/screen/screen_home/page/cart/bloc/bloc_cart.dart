
import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class BlocCart extends Bloc {

  final SetCostUseCase _setCostUseCase;
  final SetCartUseCase _setOrderUseCase;

  final SetMealUseCase _setMealUseCase;
  final SetQuantityMealUseCase _setQuantityMealUseCase;
  final GetCartMealUseCase _getCartMealUseCase;
  final GetCartMealsUseCase _getCartMealsUseCase;
  final DeleteCartMealUseCase _deleteCartMealUseCase;

  BlocCart(this._setCostUseCase, this._setOrderUseCase, this._setMealUseCase, this._deleteCartMealUseCase,
      this._getCartMealUseCase, this._getCartMealsUseCase, this._setQuantityMealUseCase);

  Stream<DataState<List<CostData>?>> getCostsService(CostParams? params) async* {
    final dataState = await _setCostUseCase(params: params);
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

  Stream<DataState<OrderData?>> setOrderService(CartParams? params) async* {
    final dataState = await _setOrderUseCase(params: params);
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


  Future<dynamic> setMealService(MealData? params) async => await _setMealUseCase(params: params);

  Future<dynamic> setQuantityMealService(QuantityParams? params) async => await _setQuantityMealUseCase(params: params);

  Future<dynamic> deleteMealService(int? params) async => await _deleteCartMealUseCase(params: params);

  Stream<MealData?> getMealService(int? params) async* {
    final dataState = await _getCartMealUseCase(params: params);
    if (dataState != null) {
      yield dataState;
    } else {
      yield null;
    }
  }

  Stream<List<MealData>?> getAllMealService() async* {
    final dataState = await _getCartMealsUseCase();
    if (dataState != null) {
      yield dataState;
    } else {
      yield [];
    }
  }


  @override
  void dispose() {

  }

}