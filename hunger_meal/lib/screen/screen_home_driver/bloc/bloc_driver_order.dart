
import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class BlocDriverOrder extends Bloc {

  final GetDriverOrdersAcceptUseCase _getDriverOrdersUseCase;
  final GetDriverOrdersDeliveredUseCase _getDriverOrdersDeliveredUseCase;
  final GetDriverOrdersWaitingUseCase _getDriverOrdersWaitingUseCase;
  final GetDriverOrdersRejectedUseCase _getDriverOrdersRejectedUseCase;
  final GetDriverOrderUseCase _getDriverOrderUseCase;

  final SetStatusDriverOrderUseCase _setStatusDriverOrderUseCase;

  BlocDriverOrder(this._getDriverOrdersUseCase, this._getDriverOrderUseCase,
      this._getDriverOrdersRejectedUseCase, this._getDriverOrdersWaitingUseCase,
      this._getDriverOrdersDeliveredUseCase, this._setStatusDriverOrderUseCase,);

  Stream<DataState<OrderData?>> getDriverOrderService(int? params) async* {
    final dataState = await _getDriverOrderUseCase(params: params);
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

  Stream<DataState<List<OrderData>?>> getDriverOrdersAcceptService(int? params) async* {
    final dataState = await _getDriverOrdersUseCase(params: params);
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

  Stream<DataState<List<OrderData>?>> getDriverOrdersDeliveredService(int? params) async* {
    final dataState = await _getDriverOrdersDeliveredUseCase(params: params);
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

  Stream<DataState<List<OrderData>?>> getDriverOrdersWaitingService(int? params) async* {
    final dataState = await _getDriverOrdersWaitingUseCase(params: params);
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

  Stream<DataState<List<OrderData>?>> getDriverOrdersRejectedService(int? params) async* {
    final dataState = await _getDriverOrdersRejectedUseCase(params: params);
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

  Stream<DataState<String?>> setStatusDriverOrderService(StateOrderParams? params) async* {
    final dataState = await _setStatusDriverOrderUseCase(params: params);
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