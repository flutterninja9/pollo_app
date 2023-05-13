import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pollo_education/utils/core_providers.dart';

class LoggingInterceptors extends Interceptor {
  final Ref ref;

  LoggingInterceptors(this.ref);
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    ref.read(loggerProvider).i("REQUEST[${options.method}] => PATH: ${options.path}");
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    ref.read(loggerProvider).i("RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}");
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    ref.read(loggerProvider).e("ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}");
    return super.onError(err, handler);
  }
}
