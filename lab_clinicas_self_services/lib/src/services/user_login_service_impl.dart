import 'package:lab_clinicas_core/lab_clinicas_core.dart';
import 'package:lab_clinicas_self_services/src/repositories/user/user_repository.dart';
import 'package:lab_clinicas_self_services/src/services/user_login_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserLoginServiceImpl implements UserLoginService {
  final UserRepository _userRepository;

  UserLoginServiceImpl({required UserRepository userRepository})
      : _userRepository = userRepository;

  @override
  Future<Either<ServiceException, Unit>> execute(
      String email, String password) async {
    final loginResult = await _userRepository.login(email, password);

    switch (loginResult) {
      case Left(valeu: AuthError(:final message)):
        return Left(ServiceException(message: message));
      case Left(valeu: AuthUnauthorizedExcetion()):
        return Left(ServiceException(message: 'E-mail ou senha invalido'));
      case Right(valeu: final accessToken):
        final sp = await SharedPreferences.getInstance();
        sp.setString(LocalStorage.accessToken, accessToken);
        return Right(unit);
    }
  }
}
