sealed class AuthExcetion implements Exception {
  final String message;

  AuthExcetion({required this.message});
}

final class AuthError extends AuthExcetion {
  AuthError({required super.message});
}

final class AuthUnauthorizedExcetion extends AuthExcetion {
  AuthUnauthorizedExcetion() : super(message: '');
}
