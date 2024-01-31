import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:lab_clinicas_self_services/src/modules/auth/login/login_router.dart';
import 'package:lab_clinicas_self_services/src/repositories/user/user_repository.dart';
import 'package:lab_clinicas_self_services/src/repositories/user/user_repository_impl.dart';

class AuthModule extends FlutterGetItModule {
  @override
  String get moduleRouteName => '/auth';

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<UserRepository>(
          (i) => UserRepositoryImpl(restClient: i()),
        )
      ];

  @override
  Map<String, WidgetBuilder> get pages => {
        '/login': (_) => const LoginRouter(),
      };
}
