import 'dart:io';

import 'package:core/core.dart';
import 'package:data/datasources/remote/api_service.dart';
import 'package:data/datasources/service/network_info_service.dart';
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';

class DriverOrderRepositoryImpl implements DriverOrderRepository {

  final NetworkInfoService _networkInfoService;
  final ApiService _mfcApiService;

  const DriverOrderRepositoryImpl(this._mfcApiService, this._networkInfoService,);


  @override
  Future<DataState<OrderData?>> getDriverOrderAction(int? params) async {
    if (await _networkInfoService.isConnected) {
      try {
        final httpResponse = await _mfcApiService.getDriverOrderService(
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
  Future<DataState<List<OrderData>?>> getDriverOrdersAcceptAction(int? params) async {
    if (await _networkInfoService.isConnected) {
      try {
        final httpResponse = await _mfcApiService.getDriverOrdersAcceptService(
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
  Future<DataState<List<OrderData>?>> getDriverOrdersDeliveredAction(int? params) async {
    if (await _networkInfoService.isConnected) {
      try {
        final httpResponse = await _mfcApiService.getDriverOrdersDeliveredService(
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
  Future<DataState<List<OrderData>?>> getDriverOrdersRejectedAction(int? params) async {
    if (await _networkInfoService.isConnected) {
      try {
        final httpResponse = await _mfcApiService.getDriverOrdersRejectedService(
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
  Future<DataState<List<OrderData>?>> getDriverOrdersWaitingAction(int? params) async {
    if (await _networkInfoService.isConnected) {
      try {
        final httpResponse = await _mfcApiService.getDriverOrdersWaitingService(
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
  Future<DataState<String?>> setStateDriverOrderAction(StateOrderParams? params) async {
    if (await _networkInfoService.isConnected) {
      try {
        switch(params?.state) {

          case StateRestaurantOrder.rejected:
           final httpResponse = await _mfcApiService.rejectDriverOrderService(
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
            final httpResponse = await _mfcApiService.deliveredDriverOrderService(
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

            final httpResponse = await _mfcApiService.acceptDriverOrderService(
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
