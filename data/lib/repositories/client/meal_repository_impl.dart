import 'dart:io';

import 'package:core/core.dart';
import 'package:data/datasources/remote/api_service.dart';
import 'package:data/datasources/service/network_info_service.dart';
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';

class MealRepositoryImpl implements MealRepository {

  final NetworkInfoService _networkInfoService;
  final ApiService _mfcApiService;

  const MealRepositoryImpl(this._mfcApiService, this._networkInfoService,);


  @override
  Future<DataState<List<MealData>?>> getMealsAction() async {
    if (await _networkInfoService.isConnected) {
      try {
        final httpResponse = await _mfcApiService.getMealsService();
        if (httpResponse.response.statusCode == HttpStatus.ok) {
          return DataSuccess(httpResponse.data.meals);
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
  Future<DataState<MealData?>> getMealAction(int? params) async {
    if (await _networkInfoService.isConnected) {
      try {
        final httpResponse = await _mfcApiService.getMealService(
            params: params
        );
        if (httpResponse.response.statusCode == HttpStatus.ok) {
          return DataSuccess(httpResponse.data.mealData);
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


}
