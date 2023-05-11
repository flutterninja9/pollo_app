import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pollo_education/utils/core_providers.dart';

class DioRequestInterceptor extends Interceptor {
  final Ref ref;

  DioRequestInterceptor(this.ref);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Fetch token from storage
    final sp = ref.watch(spProvider);
    final token = sp.getString("token");

    // Add token to header
    if (token != null) {
      options.headers["Authorization"] = "Bearer $token";
    }

    return handler.next(options);
  }
}
