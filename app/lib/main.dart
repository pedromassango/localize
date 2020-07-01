/*
 * Copyright 2020 Pedro Massango. All rights reserved.
 * Created by Pedro Massango on 1/7/2020.
 */

import 'package:app/src/infrastructure/auth/default_auth_facade.dart';
import 'package:app/src/infrastructure/auth/default_auth_service.dart';
import 'package:app/src/preferences/auth_state_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'src/application/auth/auth_state_view_model.dart';
import 'src/presentation/core/app_module.dart';

final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final preferences = await SharedPreferences.getInstance();
  final authStatePreferences = AuthStatePreferences(preferences);
  final authService = DefaultAuthService(firebaseAuth, googleSignIn);
  final authFacade = DefaultAuthFacade(authService);
  final authStateViewModel = AuthStateViewModel(
    preferences: authStatePreferences,
    authFacade: authFacade
  );

  runApp(ModularApp(module: AppModule(authStateViewModel: authStateViewModel)));
}
