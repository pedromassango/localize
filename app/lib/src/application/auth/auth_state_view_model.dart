/*
 * Copyright 2020 Pedro Massango. All rights reserved.
 * Created by Pedro Massango on 1/7/2020.
 */

import 'package:app/src/domain/auth/auth_facade.dart';
import 'package:app/src/domain/core/failures.dart';
import 'package:app/src/domain/core/user.dart';
import 'package:app/src/preferences/auth_state_preferences.dart';
import 'package:app/src/presentation/home/home_page.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobx/mobx.dart';

part 'auth_state_view_model.g.dart';

class AuthStateViewModel = _AuthStateViewModelBase with _$AuthStateViewModel;

abstract class _AuthStateViewModelBase with Store {
  _AuthStateViewModelBase({
    @required this.preferences,
    @required this.authFacade,
  }) : assert(preferences != null),
       assert(authFacade != null);

  final AuthFacade authFacade;
  final AuthStatePreferences preferences;

  @observable
  bool isLoggedIn = false;

  @observable
  AuthFailure authFailure;

  @observable
  UserFailure userFailure;

  @observable
  User user;

  @action
  Future loadUserInfo() async {
    final userResult = await authFacade.getUser();
    userResult.fold(
          (l) => userFailure = l,
          (r) {
            user = r;
            isLoggedIn = true;
          },
    );
  }

  @action
  Future signInAnonymously() async {
    final result = await authFacade.signInAnonymously();
    if (result.isRight()) {
      final userResult = await authFacade.getUser();
      userResult.fold((l) => userFailure = l, (r) => user = r);
      isLoggedIn = true;
      return;
    }
    result.fold((l) => authFailure = l, id);
  }

  @action
  Future loginWithGoogle() async {
    final isAuthenticated = await authFacade.isAuthenticated();
    if (!isAuthenticated) {
      final result = await authFacade.authWithGoogle();
      if (result.isRight()) {
        preferences.setLoginStatus(true);
        final currentUser = await authFacade.getUser();
        currentUser.fold(
              (l) => userFailure = l,
              (r) => user = r,
        );
        return;
      }
      result.fold((l) => authFailure = l,(_) {});
    } else {
      isLoggedIn = true;
      preferences.setLoginStatus(isLoggedIn);
    }
  }

  @action
  Future loginWithGitHub() async {
    final isAuthenticated = await authFacade.isAuthenticated();
    if (!isAuthenticated) {
      final result = await authFacade.authWithGitHub();
      if (result.isRight()) {
        preferences.setLoginStatus(true);
        final currentUser = await authFacade.getUser();
        currentUser.fold(
              (l) => userFailure = l,
              (r) => user = r,
        );
        return;
      }
      result.fold((l) => authFailure = l,(_) {});
    } else {
      isLoggedIn = true;
      preferences.setLoginStatus(isLoggedIn);
    }
  }
}

