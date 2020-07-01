/*
 * Copyright 2020 Pedro Massango. All rights reserved.
 * Created by Pedro Massango on 1/7/2020.
 */

import 'package:app/main.dart';
import 'package:app/src/domain/auth/auth_facade.dart';
import 'package:app/src/domain/core/failures.dart';
import 'package:app/src/domain/core/user.dart';
import 'package:app/src/preferences/auth_state_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
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
  GoogleSignInAccount firebaseUserIdentity;

  @observable
  UserFailure userFailure;

  @observable
  User user;

  @action
  Future getFirebaseUser() async {
    firebaseUserIdentity = await googleSignIn.signInSilently();
  }

  @action
  Future loginWithGoogle() async {
    final isAuthenticated = await authFacade.isAuthenticated();
    if (!isAuthenticated) {
      final result = await authFacade.authWithGoogle();
      if (result.isRight()) {
        preferences.setLoginStatus(true);
        getFirebaseUser();
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
        getFirebaseUser();
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

