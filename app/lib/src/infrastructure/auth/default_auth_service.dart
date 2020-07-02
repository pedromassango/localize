/*
 * Copyright 2020 Pedro Massango. All rights reserved.
 * Created by Pedro Massango on 2/7/2020.
 */

import 'dart:convert';

import 'package:app/src/domain/auth/auth_service.dart';
import 'package:app/src/domain/core/failures.dart';
import 'package:app/src/domain/core/user.dart';
import 'package:app/src/domain/core/value_objects/unique_id.dart';
import 'package:app/src/infrastructure/auth/user_mapper.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/adapter_browser.dart';
import 'package:dio/browser_imp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:dio/dio.dart';

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
    //throw UnimplementedError('This feature was not implemented.');
    final authorizationCode = await _getGitHubAuthorization();
    if (authorizationCode == null) {
      //return left(AuthFailure.networkError());
    }
    final gitHubToken = await _getGitHubToken(authorizationCode);

    if (gitHubToken == null) {
      return left(AuthFailure.networkError());
    }

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

  @override
  Future<Either<AuthFailure, Unit>> signInAnonymously() async {
    final AuthResult authResult = await firebaseAuth.signInAnonymously();
    final FirebaseUser user = authResult.user;

    if (user == null) {
      return left(AuthFailure.authCanceled());
    }
    // TODO: check other authentication exceptions
    print('Anonymous account created');
    return right(unit);
  }

  UniqueId _tokenRequestCodeId;
  Future<String> _getGitHubAuthorization() async {
    _tokenRequestCodeId = UniqueId.generate();
    //TODO: feature locked due to: https://github.com/isaacs/github/issues/330
    throw UnimplementedError('This feature was not implemented.');
    try {
      var headers = {
        'Content-type': 'application/json;charset=UTF-8',
        'Accept': 'application/json;charset=UTF-8',
      };
      final body = json.encode({
        'client_id': '58924d3d49a76b49d77b',
        //'scope': 'read:user',
        'client_secret': '71763129a5e125eb9a154e8c37f15b17b49ec196',
        'state': _tokenRequestCodeId.getOrThrow(),
      });

      final options = BaseOptions(
        headers: headers
      );
      final dio = DioForBrowser(options);
      final adapter = BrowserHttpClientAdapter();
      adapter.withCredentials = true;
      dio.httpClientAdapter = adapter;

      final response = await dio.post('https://github.com/login/oauth/authorize',
        data: body,
        options: Options(headers: headers)
      );
      final Map<String, dynamic> responseData = (response.data as Map<String, dynamic>);
      if (responseData.containsKey('code')) {
        return responseData['code'].toString();
      }
      return null;
    } on DioError catch(e) {
      return null;
    }
  }

  Future<String> _getGitHubToken(String code) async {
    try {
      var headers = {
        'Content-type': 'application/json;charset=UTF-8',
        'Accept': 'application/json;charset=UTF-8',
      };
      final body = json.encode({
        'client_id': '58924d3d49a76b49d77b',
        'client_secret': '71763129a5e125eb9a154e8c37f15b17b49ec196',
        //'scope': 'read:user',
        'code': code,
        'state': _tokenRequestCodeId.getOrThrow(),
      });

      final options = BaseOptions(
          headers: {
            'Accept': 'application/json'
          }
      );
      final dio = DioForBrowser(options);
      final adapter = BrowserHttpClientAdapter();
      adapter.withCredentials = true;
      dio.httpClientAdapter = adapter;
      final response = await dio.post('https://github.com/login/oauth/access_token',
        data: body,
        options: Options(headers: headers)
      );
      final Map<String, dynamic> responseData = (response.data as Map<String, dynamic>);
      if (responseData.containsKey('access_token')) {
        return responseData['access_token'].toString();
      }
      return null;
    } on DioError catch(e) {
      return null;
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