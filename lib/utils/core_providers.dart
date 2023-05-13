import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:pollo_education/utils/dio_request_interceptor.dart';
import 'package:pollo_education/utils/logger_interceptor.dart';
import 'package:shared_preferences/shared_preferences.dart';

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(BaseOptions(
      connectTimeout: const Duration(seconds: 3),
      receiveTimeout: const Duration(seconds: 5),
      baseUrl: "https://polloeducation.ashwanimishra.online/api"));

  dio.interceptors.add(LoggingInterceptors(ref));
  dio.interceptors.add(DioRequestInterceptor(ref));

  return dio;
});

final loggerProvider = Provider<Logger>((ref) {
  return Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      errorMethodCount: 8,
      lineLength: 120,
      colors: true,
      printEmojis: true,
      printTime: false,
    ),
  );
});

final spProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});
