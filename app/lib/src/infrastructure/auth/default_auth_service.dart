/*
 * Copyright 2020 Pedro Massango. All rights reserved.
 * Created by Pedro Massango on 1/7/2020.
 */

import 'dart:convert';

import 'package:app/src/domain/auth/auth_service.dart';
import 'package:app/src/domain/core/failures.dart';
import 'package:app/src/domain/core/user.dart';
import 'package:app/src/infrastructure/auth/user_mapper.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

class APIUrl {
  static String host = "https://github.com";
  static String host2 = "https://api.github.com";

  //user
  static String user = "$host2/user";
  static String getUserRepo = "$user/repos";

  //login authorization
  static String login = "$host/login";
  static String oauth = "$login/oauth";
  static String accessToken = "$oauth/access_token";

  static String authorize(clientId) => "$oauth/authorize?client_id=$clientId";
}

class DefaultAuthService extends AuthService {
  DefaultAuthService(FirebaseAuth firebaseAuth, GoogleSignIn googleSignIn) :
        super(firebaseAuth, googleSignIn);

  @override
  Future<Either<AuthFailure, Unit>> authWithGoogle() async {
    final GoogleSignInAccount googleAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleAccount.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      idToken: googleAuth.idToken,
      accessToken: googleAuth.accessToken,
    );

    final AuthResult authResult = await firebaseAuth.signInWithCredential(credential);
    final FirebaseUser user = authResult.user;

    if (user == null) {
      return left(AuthFailure.authCanceled());
    }
    // TODO: check other authentication exceptions
    return right(unit);
  }

  @override
  Future<Either<AuthFailure, Unit>> authWithGitHub() async {
    //TODO: feature locked due to: https://github.com/isaacs/github/issues/330
    throw UnimplementedError('This feature was not implemented.');
    final gitHubTokenResult = await _getGitHubToken();

    if (gitHubTokenResult.isLeft()) {
      return left(AuthFailure.networkError());
    }

    final gitHubToken = gitHubTokenResult.getOrElse(() => '');

    final AuthCredential credential = GithubAuthProvider.getCredential(
      token: gitHubToken
    );

    final AuthResult authResult = await firebaseAuth.signInWithCredential(credential);
    final FirebaseUser user = authResult.user;

    if (user == null) {
      return left(AuthFailure.authCanceled());
    }
    // TODO: check other authentication exceptions
    return right(unit);
  }

  Future<Either<Unit, String>> _getGitHubToken() async {
    //TODO: feature locked due to: https://github.com/isaacs/github/issues/330
    throw UnimplementedError('This feature was not implemented.');
    try {
      var headers = {
        'Content-type': 'application/json;charset=UTF-8',
        'Accept': 'application/json;charset=UTF-8',
      };
      final body = json.encode(
          {
            'client_id': '58924d3d49a76b49d77b',
            'client_secret': '71763129a5e125eb9a154e8c37f15b17b49ec196',
          //'scope': 'read:user',
            'code': null,
          });
      var response = await http.post(APIUrl.accessToken,
        body: body,
        headers: headers,
      );
      if (response != null && response.statusCode == 200 &&
          response.body.contains('access_token')) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        return right(responseData['access_token']);
      } else {
        return left(unit);
      }
    } on Exception catch(e) {
      return left(unit);
    }
  }

  @override
  Future<Either<UserFailure, User>> getUser() async {
    final firebaseUse = await firebaseAuth.currentUser();
    if (firebaseUse == null)
      return left(UserFailure.userNotFound());
    final user = firebaseUserToUser(firebaseUse);
    return right(user);
  }

  @override
  Future<bool> isAuthenticated() => googleSignIn.isSignedIn();

  @override
  Stream<User> onAuthStateChanged() {
    return firebaseAuth.onAuthStateChanged.map(firebaseUserToUser);
  }

}