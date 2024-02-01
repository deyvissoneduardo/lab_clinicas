import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:lab_clinicas_core/src/rest_client/interceptor/auth_interceptors.dart';

final class RestClient extends DioForNative {
  RestClient()
      : super(
          BaseOptions(
            baseUrl: 'http://192.168.1.110:8080',
            connectTimeout: const Duration(seconds: 10),
            receiveTimeout: const Duration(seconds: 60),
          ),
        ) {
    interceptors.addAll([
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        error: true,
        request: true,
        requestHeader: true,
        responseHeader: true,
      ),
      AuthInterceptors()
    ]);
  }

  RestClient get auth {
    options.extra['DIO_AUTH_KEY'] = true;
    return this;
  }

  RestClient get unauth {
    options.extra['DIO_AUTH_KEY'] = false;
    return this;
  }
}
