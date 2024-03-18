import 'dart:io';

import 'package:core/core.dart';
import 'package:data/datasources/remote/api_service.dart';
import 'package:data/datasources/service/network_info_service.dart';
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';

class RestaurantRepositoryImpl implements RestaurantRepository {

  final NetworkInfoService _networkInfoService;
  final ApiService _mfcApiService;

  const RestaurantRepositoryImpl(this._mfcApiService, this._networkInfoService,);


  @override
  Future<DataState<RestaurantData?>> getRestaurantAction(int? params) async {
    if (await _networkInfoService.isConnected) {
      try {
        final httpResponse = await _mfcApiService.getRestaurantService(
            params: params
        );
        if (httpResponse.response.statusCode == HttpStatus.ok) {
          return DataSuccess(httpResponse.data.restaurant);
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
  Future<DataState<List<RestaurantData>?>> getRestaurantsAction() async {
    if (await _networkInfoService.isConnected) {
      try {
        final httpResponse = await _mfcApiService.getRestaurantsService();
        if (httpResponse.response.statusCode == HttpStatus.ok) {
          return DataSuccess(httpResponse.data.users?.restaurants);
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
