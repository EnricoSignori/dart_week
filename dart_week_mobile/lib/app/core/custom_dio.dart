import 'dart:io';

import 'package:dart_week_mobile/app/repositories/user_repository.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class CustomDio {
  Dio _dio;

  CustomDio() {
    _dio = Dio(_options);
  }

  CustomDio.withAutentication() {
    _dio = Dio(_options);
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: _onRequest,
        onResponse: _onResponse,
        onError: _onError,
      ),
    );
  }

  BaseOptions _options = BaseOptions(
    baseUrl: Platform.isIOS ? 'http://localhost' : 'http://192.168.0.15',
    connectTimeout: 30000,
    receiveTimeout: 30000,
  );

  Dio get instance => _dio;

  _onRequest(RequestOptions options) async {
    String token = await UserRepository().getToken();
    options.headers['Authorization'] = token;
  }

  _onResponse(Response e) {
    print('########## Response log');
    print(e.data);
    print('########## Response log');
  }

  _onError(DioError e) {
    if (e.response?.statusCode == 403 || e.response?.statusCode == 401) {
      UserRepository().logout();
      Get.offAllNamed('/');
    }

    return e;
  }
}
