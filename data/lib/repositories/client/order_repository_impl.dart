import 'dart:io';

import 'package:core/core.dart';
import 'package:data/datasources/local/DAOs/database_service.dart';
import 'package:data/datasources/remote/api_service.dart';
import 'package:data/datasources/service/network_info_service.dart';
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';
import 'package:flutter/foundation.dart';

class OrderRepositoryImpl implements OrderRepository {

  final NetworkInfoService _networkInfoService;
  final DataBaseService _dataBaseService;
  final ApiService _mfcApiService;

  const OrderRepositoryImpl(this._mfcApiService, this._dataBaseService, this._networkInfoService,);

  @override
  Future<DataState<List<CostData>?>> getCostsAction(CostParams? params) async {
    if (await _networkInfoService.isConnected) {
      try {
        final httpResponse = await _mfcApiService.getCostsService(
            params: params
        );
        if (httpResponse.response.statusCode == HttpStatus.ok) {
          return DataSuccess(httpResponse.data);
        }
        return DataFailed(
          DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            requestOptions: httpResponse.response.requestOptions,
          ),
        );
      } on DioException catch (e) {
        return DataFailed(e);
      }
    } else {
      return const DataConnexion({"message": Constant.noConnexionData});
    }
  }

  @override
  Future<DataState<OrderData?>> setCartOrderAction(CartParams? params) async {
    if (await _networkInfoService.isConnected) {
      try {
        final httpResponse = await _mfcApiService.setCartOrdersService(
            params: params
        );
        if (httpResponse.response.statusCode == HttpStatus.ok) {
          return DataSuccess(httpResponse.data);
        }
        return DataFailed(
          DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            requestOptions: httpResponse.response.requestOptions,
          ),
        );
      } on DioException catch (e) {
        return DataFailed(e);
      }
    } else {
      return const DataConnexion({"message": Constant.noConnexionData});
    }
  }

  @override
  Future<dynamic> deleteMealAction(int? params) async {
    return await _dataBaseService.deleteMeal(id: params);
  }

  @override
  Future<DataState> deleteMealsAction() {
    // TODO: implement deleteMealsAction
    throw UnimplementedError();
  }

  @override
  Future<MealData?> getMealAction(int? params) async {
    final dataMeal = await _dataBaseService.getMeal(id: params);
    return dataMeal;
  }

  @override
  Future<List<MealData>?> getMealsAction() async {
    final dataList = await _dataBaseService.getAllMeals();
    return dataList;
  }

  @override
  Future<dynamic> setMealAction(MealData? params) async {
    return await _dataBaseService.insertMeal(meal: params);
  }

  @override
  Future<dynamic> setQuantityMealAction(QuantityParams? params) async {
    return await _dataBaseService.updateQuantityMeal(id: params?.mealId, quantity: params?.quantity);
  }




}
