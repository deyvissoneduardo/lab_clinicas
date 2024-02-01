import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';
import 'package:lab_clinicas_self_services/src/binding/lab_clinica_application_bindings.dart';
import 'package:lab_clinicas_self_services/src/modules/auth/auth_module.dart';
import 'package:lab_clinicas_self_services/src/modules/home/home_modules.dart';
import 'package:lab_clinicas_self_services/src/pages/splash_pages/splash_page.dart';

void main() {
  runZonedGuarded(() => runApp(const LabClinicaSelfService()), (error, stack) {
    log('error não tratado', error: error, stackTrace: stack);
    throw error;
  });
}

class LabClinicaSelfService extends StatelessWidget {
  const LabClinicaSelfService({super.key});

  @override
  Widget build(BuildContext context) {
    return LabClinicasCoreConfigCore(
      title: 'Lab Clinica Auto Atendimento',
      bindings: LabClinicaApplicationBindings(),
      pagesBuilders: [
        FlutterGetItPageBuilder(
          page: (context) => const SplashPage(),
          path: '/',
        )
      ],
      modules: [
        AuthModule(),
        HomeModules(),
      ],
    );
  }
}
