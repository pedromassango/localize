/*
 * Copyright 2020 Pedro Massango. All rights reserved.
 * Created by Pedro Massango on 1/7/2020.
 */

import 'package:app/src/domain/auth/auth_service.dart';
import 'package:app/src/domain/core/failures.dart';
import 'package:app/src/domain/core/user.dart';
import 'package:dartz/dartz.dart';

abstract class AuthFacade {
  final AuthService authService;

  AuthFacade(this.authService) : assert(authService != null);

  Future<Either<AuthFailure, Unit>> authWithGoogle();

  Future<Either<AuthFailure, Unit>> authWithGitHub();

  Future<Either<UserFailure, User>> getUser();

  Future<bool> isAuthenticated();

  Stream<User> onAuthStateChanged();
}