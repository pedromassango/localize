/*
 * Copyright 2020 Pedro Massango. All rights reserved.
 * Created by Pedro Massango on 1/7/2020.
 */

import 'package:app/src/domain/auth/auth_facade.dart';
import 'package:app/src/domain/auth/auth_service.dart';
import 'package:app/src/domain/core/failures.dart';
import 'package:app/src/domain/core/user.dart';
import 'package:dartz/dartz.dart';

class DefaultAuthFacade extends AuthFacade {
  DefaultAuthFacade(AuthService authService) : super(authService);

  @override
  Future<Either<AuthFailure, Unit>> authWithGoogle() {
    return authService.authWithGoogle();
  }

  @override
  Future<Either<AuthFailure, Unit>> authWithGitHub() {
    return authService.authWithGitHub();
  }

  @override
  Future<Either<UserFailure, User>> getUser() {
    return authService.getUser();
  }

  @override
  Future<bool> isAuthenticated() {
    return authService.isAuthenticated();
  }

  @override
  Stream<User> onAuthStateChanged() {
    return authService.onAuthStateChanged();
  }

}