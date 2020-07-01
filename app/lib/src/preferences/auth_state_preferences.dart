/*
 * Copyright 2020 Pedro Massango. All rights reserved.
 * Created by Pedro Massango on 1/7/2020.
 */

import 'package:shared_preferences/shared_preferences.dart';

class AuthStatePreferences {
  static const _authStateKey = '_is_logged_in';

  final SharedPreferences _preferences;

  AuthStatePreferences(this._preferences) : assert(_preferences != null);

  bool isLoggedIn() {
    return _preferences.getBool(_authStateKey) ?? false;
  }

  Future setLoginStatus(bool status) {
    return _preferences.setBool(_authStateKey, status);
  }
}