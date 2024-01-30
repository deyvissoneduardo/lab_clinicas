import 'package:dio/dio.dart';
import 'package:lab_clinicas_core/src/constants/local_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

final class AuthInterceptors extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final RequestOptions(:headers, :extra) = options;
    const authHeaderKey = 'Authorization';
    headers.remove(authHeaderKey);

    if (extra case {'DIO_AUTH_KEY': true}) {
      final sp = await SharedPreferences.getInstance();
      headers.addAll(
        {
          authHeaderKey: 'Bearer ${sp.getString(LocalStorage.accessToken)}',
        },
      );
    }

    handler.next(options);
  }
}
