import 'package:core/core.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'local_storage_service.dart';

const String authorization = "Authorization";
const String language = "Language";

class DioFactoryService {

  final LocalStorageService _appPreferences;

  DioFactoryService(this._appPreferences);

  Future<Dio> getDio() async {
    Dio dio = Dio();
    String language = await _appPreferences.getAppLanguage();
    String token = await _appPreferences.getUserToken();
    Map<String, String> headers = {
      authorization: token,
      language: language
    };

    dio.options = BaseOptions(
        baseUrl: Constant.kBaseUrl,
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 10),
        headers: headers
    );

    if (kReleaseMode) {
      debugPrint("release mode no logs");
    } else {

      /// dio.interceptors.add(HttpFormatter());

      dio.interceptors.add(DioLoggerInterceptor(
          requestHeader: true, requestBody: true, responseBody: true,
          responseHeader: false, error: true, compact: true, maxWidth: 120,
      ));
    }
    return dio;
  }
}


