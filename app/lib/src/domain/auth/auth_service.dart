/*
 * Copyright 2020 Pedro Massango. All rights reserved.
 * Created by Pedro Massango on 1/7/2020.
 */

import 'package:app/src/domain/core/failures.dart';
import 'package:app/src/domain/core/user.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class AuthService {
  final FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn;

  AuthService(this.firebaseAuth, this.googleSignIn) :
        assert(firebaseAuth != null),
        assert(googleSignIn != null);

  Future<Either<AuthFailure, Unit>> authWithGoogle();

  Future<Either<AuthFailure, Unit>> authWithGitHub();

  Future<Either<AuthFailure, Unit>> signInAnonymously();

  Future<Either<UserFailure, User>> getUser();

  Future<bool> isAuthenticated();

  Stream<User> onAuthStateChanged();

}