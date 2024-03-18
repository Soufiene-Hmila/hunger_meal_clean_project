
import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:domain/usecaes/client/get_zones_use_case.dart';
import 'package:flutter/material.dart';

class BlocUser extends Bloc {

  final SetPhoneUseCase _setLoginUseCase;
  final SetVerificationUseCase _setVerificationUseCase;
  final SetInfoUseCase _setInfoUseCase;
  final GetProfileUseCase _getProfileUseCase;
  final SetResetVerificationUseCase _setResetVerificationUseCase;
  final GetZonesUseCase _getZonesUseCase;

  BlocUser(this._setLoginUseCase, this._setInfoUseCase, this._getZonesUseCase,
      this._setVerificationUseCase, this._getProfileUseCase, this._setResetVerificationUseCase);

  Stream<DataState<LoginData?>> setPhoneService(PhoneParams? params) async* {
    final dataState = await _setLoginUseCase(params: params);
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

  Stream<DataState<VerificationData?>> setVerificationService(VerificationParams? params) async* {
    final dataState = await _setVerificationUseCase(params: params);
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

  Stream<DataState<LoginData?>> setResetVerificationService(PhoneParams? params) async* {
    final dataState = await _setResetVerificationUseCase(params: params);
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

  Stream<DataState<String?>> setInfoService(InfoParams? params) async* {
    final dataState = await _setInfoUseCase(params: params);
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

  Stream<DataState<ProfileData?>> getProfileService(int? params) async* {
    final dataState = await _getProfileUseCase(params: params);
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

  Stream<DataState<List<ZoneAddressData>?>> getZonesService() async* {
    final dataState = await _getZonesUseCase();
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