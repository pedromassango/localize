/*
 * Copyright 2020 Pedro Massango. All rights reserved.
 * Created by Pedro Massango on 5/7/2020.
 */

import 'package:app/src/presentation/auth/auth_page.dart';
import 'package:app/src/application/auth/auth_state_view_model.dart';
import 'package:app/src/presentation/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cubit/flutter_cubit.dart';
import 'package:flutter_modular/flutter_modular.dart';

class App extends StatelessWidget {
  final AuthStateViewModel authStateViewModel;

  const App({this.authStateViewModel}) : assert(authStateViewModel != null);

  @override
  Widget build(BuildContext context) {
    return  CubitProvider<AuthStateViewModel>(
      create: (context) => authStateViewModel,
      child: MaterialApp(
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
            if (authStateViewModel.state.isLoggedIn) {
              return HomePage();
            }
            return AuthPage();
          },
        ),
      ),
    );
  }
}