
import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class BlocRestaurantOrder extends Bloc {

  final GetRestaurantOrdersAcceptUseCase _getRestaurantOrdersUseCase;
  final GetRestaurantOrdersDeliveredUseCase _getRestaurantOrdersDeliveredUseCase;
  final GetRestaurantOrdersWaitingUseCase _getRestaurantOrdersWaitingUseCase;
  final GetRestaurantOrdersRejectedUseCase _getRestaurantOrdersRejectedUseCase;
  final GetRestaurantOrderUseCase _getRestaurantOrderUseCase;

  final SetStatusRestaurantOrderUseCase _setStatusRestaurantOrderUseCase;

  BlocRestaurantOrder(this._getRestaurantOrdersUseCase, this._getRestaurantOrderUseCase,
      this._getRestaurantOrdersRejectedUseCase, this._getRestaurantOrdersWaitingUseCase,
      this._getRestaurantOrdersDeliveredUseCase, this._setStatusRestaurantOrderUseCase,);

  Stream<DataState<OrderData?>> getRestaurantOrderService(int? params) async* {
    final dataState = await _getRestaurantOrderUseCase(params: params);
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

  Stream<DataState<List<OrderData>?>> getRestaurantOrdersAcceptService(int? params) async* {
    final dataState = await _getRestaurantOrdersUseCase(params: params);
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

  Stream<DataState<List<OrderData>?>> getRestaurantOrdersDeliveredService(int? params) async* {
    final dataState = await _getRestaurantOrdersDeliveredUseCase(params: params);
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

  Stream<DataState<List<OrderData>?>> getRestaurantOrdersWaitingService(int? params) async* {
    final dataState = await _getRestaurantOrdersWaitingUseCase(params: params);
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

  Stream<DataState<List<OrderData>?>> getRestaurantOrdersRejectedService(int? params) async* {
    final dataState = await _getRestaurantOrdersRejectedUseCase(params: params);
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

  Stream<DataState<String?>> setStatusRestaurantOrderService(StateOrderParams? params) async* {
    final dataState = await _setStatusRestaurantOrderUseCase(params: params);
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