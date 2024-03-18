import 'package:dio/dio.dart';

abstract class DataState<T> {
  final T? data;
  final bool loading;
  final DioError? error;
  final Map<String, dynamic>? connexion;
  const DataState({this.data, this.loading = false, this.error, this.connexion});
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data) : super(data: data);
}

class DataLoading<T> extends DataState<T> {
  const DataLoading(bool isLoading) : super(loading: isLoading);
}

class DataFailed<T> extends DataState<T> {
  const DataFailed(DioError? error) : super(error: error);
}

class DataConnexion<T> extends DataState<T> {
  const DataConnexion(Map<String, dynamic>? connexion) : super(connexion: connexion);
}
