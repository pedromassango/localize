/*
 * Copyright 2020 Pedro Massango. All rights reserved.
 * Created by Pedro Massango on 1/7/2020.
 */

import 'package:app/src/presentation/auth/auth_page.dart';
import 'package:app/src/application/auth/auth_state_view_model.dart';
import 'package:app/src/presentation/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authState = Modular.get<AuthStateViewModel>();

    return  MaterialApp(
      title: 'Localize',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Color(0xff3d405b),
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      navigatorKey: Modular.navigatorKey,
      onGenerateRoute: Modular.generateRoute,
      home: Builder(
        builder: (context) {
          if (authState.isLoggedIn) {
            return HomePage();
          }
          return AuthPage();
        },
      ),
    );
  }
}