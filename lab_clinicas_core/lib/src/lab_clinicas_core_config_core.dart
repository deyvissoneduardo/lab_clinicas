import 'package:asyncstate/widget/async_state_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:lab_clinicas_core/src/loader/lab_clinicas_loader.dart';

import 'theme/lab_clinicas_theme.dart';

class LabClinicasCoreConfigCore extends StatelessWidget {
  final ApplicationBindings? bindings;
  final List<FlutterGetItPageRouter>? pages;
  final List<FlutterGetItPageBuilder>? pagesBuilders;
  final List<FlutterGetItModule>? modules;
  final String title;

  const LabClinicasCoreConfigCore({
    super.key,
    required this.title,
    this.bindings,
    this.pages,
    this.pagesBuilders,
    this.modules,
  });

  @override
  Widget build(BuildContext context) {
    return FlutterGetIt(
      debugMode: true,
      pages: [
        ...pages ?? [],
        ...pagesBuilders ?? [],
      ],
      bindings: bindings,
      modules: modules,
      builder: (context, routes, flutterGetItNavObserver) => AsyncStateBuilder(
        loader: LabClinicasLoader(),
        builder: (navigatorObserver) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: LabClinicasTheme.lightTheme,
          darkTheme: LabClinicasTheme.darkTheme,
          title: title,
          routes: routes,
          navigatorObservers: [
            flutterGetItNavObserver,
            navigatorObserver,
          ],
        ),
      ),
    );
  }
}
