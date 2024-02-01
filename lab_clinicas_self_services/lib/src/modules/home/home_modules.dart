import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:lab_clinicas_self_services/src/modules/home/home_page.dart';

class HomeModules extends FlutterGetItModule {
  @override
  String get moduleRouteName => '/home';

  @override
  Map<String, WidgetBuilder> get pages => {
        '/': (context) => const HomePage(),
      };
}
