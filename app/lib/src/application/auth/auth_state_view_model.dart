/*
 * Copyright 2020 Pedro Massango. All rights reserved.
 * Created by Pedro Massango on 5/7/2020.
 */

import 'package:app/src/domain/auth/auth_facade.dart';
import 'package:app/src/domain/core/failures.dart';
import 'package:app/src/domain/core/user.dart';
import 'package:app/src/preferences/auth_state_preferences.dart';
import 'package:cubit/cubit.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobx/mobx.dart';

part 'auth_state_view_model.freezed.dart';

@freezed
abstract class AuthState with _$AuthState {
  factory AuthState({
    @Default(false) bool isLoggedIn,
    UserFailure userFailure,
    AuthFailure authFailure,
    User user,
  }) = _AuthState;
}

class AuthStateViewModel extends Cubit<AuthState> {
  AuthStateViewModel({
    @required this.preferences,
    @required this.authFacade,
  }) : assert(preferences != null),
       assert(authFacade != null),
  super(AuthState());

  final AuthFacade authFacade;
  final AuthStatePreferences preferences;

  Future loadUserInfo() async {
    final userResult = await authFacade.getUser();
    userResult.fold(
          (l) => emit(state.copyWith.call(userFailure: l)),
          (r) => emit(state.copyWith.call(
            user: r,
            isLoggedIn: true
          ),
          ),
    );
  }

  Future signInAnonymously() async {
    final result = await authFacade.signInAnonymously();
    if (result.isRight()) {
      await loadUserInfo();
      return;
    }
    result.fold((l) => emit(state.copyWith.call(authFailure: l)), id);
  }

  @action
  Future loginWithGoogle() async {
    final isAuthenticated = await authFacade.isAuthenticated();
    if (!isAuthenticated) {
      final result = await authFacade.authWithGoogle();
      if (result.isRight()) {
        preferences.setLoginStatus(true);
        await loadUserInfo();
        return;
      }
      result.fold((l) => emit(state.copyWith.call(authFailure: l)), id);
    } else {
      preferences.setLoginStatus(isAuthenticated);
      await loadUserInfo();
    }
  }

  @action
  Future loginWithGitHub() async {
    final isAuthenticated = await authFacade.isAuthenticated();
    if (!isAuthenticated) {
      final result = await authFacade.authWithGitHub();
      if (result.isRight()) {
        preferences.setLoginStatus(true);
        await loadUserInfo();
        return;
      }
      result.fold((l) => emit(state.copyWith.call(authFailure: l)), id);
    } else {
      preferences.setLoginStatus(isAuthenticated);
    }
  }
}
