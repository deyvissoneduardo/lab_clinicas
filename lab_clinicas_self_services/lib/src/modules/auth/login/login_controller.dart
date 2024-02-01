import 'package:asyncstate/asyncstate.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';
import 'package:lab_clinicas_self_services/src/services/user_login_service.dart';
import 'package:signals_flutter/signals_flutter.dart';

class LoginController with MessagesStateMixin {
  final UserLoginService _loginService;

  LoginController({required UserLoginService loginService})
      : _loginService = loginService;

  final _viewPassword = signal(true);
  bool get viewPassword => _viewPassword();

  final _logged = signal(false);
  bool get logged => _logged();

  void passwordToggle() => _viewPassword.value = !_viewPassword.value;

  Future<void> login(String email, String password) async {
    final loginResult =
        await _loginService.execute(email, password).asyncLoader();

    switch (loginResult) {
      case Left(valeu: ServiceException(:final message)):
        showError(message);
      case Right(valeu: _):
        _logged.value = true;
    }
  }
}
