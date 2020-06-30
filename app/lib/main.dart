import 'package:app/src/home_module/home_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'src/home_module/home_page.dart';

void main() => runApp(ModularApp( module: AppModule()));

class LocalizeApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Localize',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: 'main',
      navigatorKey: Modular.navigatorKey,
      onGenerateRoute: Modular.generateRoute,
      home: HomePage(),
    );
  }
}

class AppModule extends MainModule {

  @override
  List<Bind> get binds => [];

  @override
  Widget get bootstrap => LocalizeApp();

  @override
  List<Router> get routers => [
    Router('main', module: HomeModule()),
  ];
}
