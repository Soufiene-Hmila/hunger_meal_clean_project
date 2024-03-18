import 'dart:io';

import 'package:core/core.dart';
import 'package:data/datasources/remote/api_service.dart';
import 'package:data/datasources/service/network_info_service.dart';
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';

class RestaurantOrderRepositoryImpl implements RestaurantOrderRepository {

  final NetworkInfoService _networkInfoService;
  final ApiService _mfcApiService;

  const RestaurantOrderRepositoryImpl(this._mfcApiService, this._networkInfoService,);


  @override
  Future<DataState<OrderData?>> getRestaurantOrderAction(int? params) async {
    if (await _networkInfoService.isConnected) {
      try {
        final httpResponse = await _mfcApiService.getRestaurantOrderService(
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
  Future<DataState<List<OrderData>?>> getRestaurantOrdersAcceptAction(int? params) async {
    if (await _networkInfoService.isConnected) {
      try {
        final httpResponse = await _mfcApiService.getRestaurantOrdersAcceptService(
          params: params
        );
        if (httpResponse.response.statusCode == HttpStatus.ok) {
          return DataSuccess(httpResponse.data.restaurantOrders);
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
  Future<DataState<List<OrderData>?>> getRestaurantOrdersDeliveredAction(int? params) async {
    if (await _networkInfoService.isConnected) {
      try {
        final httpResponse = await _mfcApiService.getRestaurantOrdersDeliveredService(
            params: params
        );
        if (httpResponse.response.statusCode == HttpStatus.ok) {
          return DataSuccess(httpResponse.data.restaurantOrders);
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
  Future<DataState<List<OrderData>?>> getRestaurantOrdersRejectedAction(int? params) async {
    if (await _networkInfoService.isConnected) {
      try {
        final httpResponse = await _mfcApiService.getRestaurantOrdersRejectedService(
            params: params
        );
        if (httpResponse.response.statusCode == HttpStatus.ok) {
          return DataSuccess(httpResponse.data.restaurantOrders);
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
  Future<DataState<List<OrderData>?>> getRestaurantOrdersWaitingAction(int? params) async {
    if (await _networkInfoService.isConnected) {
      try {
        final httpResponse = await _mfcApiService.getRestaurantOrdersWaitingService(
            params: params
        );
        if (httpResponse.response.statusCode == HttpStatus.ok) {
          return DataSuccess(httpResponse.data.restaurantOrders);
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
  Future<DataState<String?>> setStateRestaurantOrderAction(StateOrderParams? params) async {
    if (await _networkInfoService.isConnected) {
      try {
        switch(params?.state) {

          case StateRestaurantOrder.rejected:
           final httpResponse = await _mfcApiService.rejectOrderService(
                params: params?.id
            );

           if (httpResponse.response.statusCode == HttpStatus.ok) {
             return DataSuccess(httpResponse.data.message);
           }
           return DataFailed(
             DioException(
               error: httpResponse.response.statusMessage,
               response: httpResponse.response,
               requestOptions: httpResponse.response.requestOptions,
             ),
           );

          case StateRestaurantOrder.progress:
            final httpResponse = await _mfcApiService.progressOrderService(
                params: params?.id
            );

            if (httpResponse.response.statusCode == HttpStatus.ok) {
              return DataSuccess(httpResponse.data.message);
            }
            return DataFailed(
              DioException(
                error: httpResponse.response.statusMessage,
                response: httpResponse.response,
                requestOptions: httpResponse.response.requestOptions,
              ),
            );

          case StateRestaurantOrder.taken:
            final httpResponse = await _mfcApiService.takenOrderService(
                params: params?.id
            );

            if (httpResponse.response.statusCode == HttpStatus.ok) {
              return DataSuccess(httpResponse.data.message);
            }
            return DataFailed(
              DioException(
                error: httpResponse.response.statusMessage,
                response: httpResponse.response,
                requestOptions: httpResponse.response.requestOptions,
              ),
            );

          default: {

            final httpResponse = await _mfcApiService.acceptOrderService(
                params: params?.id
            );

            if (httpResponse.response.statusCode == HttpStatus.ok) {
              return DataSuccess(httpResponse.data.message);
            }

            return DataFailed(
              DioException(
                error: httpResponse.response.statusMessage,
                response: httpResponse.response,
                requestOptions: httpResponse.response.requestOptions,
              ),
            );
          }
        }
      } on DioException catch (e) {
        return DataFailed(e);
      }
    } else {
      return const DataConnexion({"message": Constant.noConnexionData});
    }
  }

}
