import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';

import 'user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final RestClient _restClient;

  UserRepositoryImpl({required RestClient restClient})
      : _restClient = restClient;

  @override
  Future<Either<AuthExcetion, String>> login(
      String email, String password) async {
    try {
      final Response(data: {'access_token': accessToken}) =
          await _restClient.unauth.post(
        '/auth',
        data: {
          'email': email,
          'password': password,
          'admin': true,
        },
      );
      return Right(accessToken);
    } on DioException catch (e, s) {
      log('Error ao realizar login', error: e, stackTrace: s);
      return switch (e) {
        DioException(response: Response(statusCode: HttpStatus.forbidden)?) =>
          Left(AuthUnauthorizedExcetion()),
        _ => Left(
            AuthError(message: 'Error ao realizar login'),
          )
      };
    }
  }
}
