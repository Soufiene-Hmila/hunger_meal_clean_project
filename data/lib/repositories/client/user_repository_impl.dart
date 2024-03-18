import 'dart:io';

import 'package:core/core.dart';
import 'package:data/datasources/remote/api_service.dart';
import 'package:data/datasources/service/network_info_service.dart';
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';

class UserRepositoryImpl implements UserRepository {

  final NetworkInfoService _networkInfoService;
  final ApiService _mfcApiService;

  const UserRepositoryImpl(this._mfcApiService, this._networkInfoService,);


  @override
  Future<DataState<LoginData?>> setPhoneAction(PhoneParams? params) async {
    if (await _networkInfoService.isConnected) {
      try {
        final httpResponse = await _mfcApiService.setPhoneService(
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
  Future<DataState<ProfileData?>> getProfileAction(int? params) async {
    if (await _networkInfoService.isConnected) {
      try {
        final httpResponse = await _mfcApiService.getProfileService(
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
  Future<DataState<List<ZoneAddressData>?>> getZonesAction() async {
    if (await _networkInfoService.isConnected) {
      try {
        final httpResponse = await _mfcApiService.getZonesService();
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
  Future<DataState<String?>> setInfoAction(InfoParams? params) async {
    if (await _networkInfoService.isConnected) {
      try {
        final httpResponse = await _mfcApiService.setInfoService(
            params: params, id: params?.id
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
      } on DioException catch (e) {
        return DataFailed(e);
      }
    } else {
      return const DataConnexion({"message": Constant.noConnexionData});
    }
  }

  @override
  Future<DataState<VerificationData?>> setVerificationAction(VerificationParams? params) async {
    if (await _networkInfoService.isConnected) {
      try {
        final httpResponse = await _mfcApiService.setVerificationService(
            params: params,
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
  Future<DataState<LoginData?>> setResetVerificationAction(PhoneParams? params) async {
    if (await _networkInfoService.isConnected) {
      try {
        final httpResponse = await _mfcApiService.setResetVerificationService(
          params: params,
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


}
