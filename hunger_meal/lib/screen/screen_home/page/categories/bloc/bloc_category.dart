
import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class BlocCategory extends Bloc {

  final GetCategoriesUseCase _getCategoriesUseCase;
  final GetCategoryUseCase _getCategoryUseCase;

  BlocCategory(this._getCategoriesUseCase, this._getCategoryUseCase,);

  Stream<DataState<CategoryData?>> getCategoryService(int? params) async* {
    final dataState = await _getCategoryUseCase(params: params);
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

  Stream<DataState<List<CategoryData>?>> getCategoriesService() async* {
    final dataState = await _getCategoriesUseCase();
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