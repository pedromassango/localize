import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_state_view_model.g.dart';

class AuthStateViewModel = _AuthStateViewModelBase with _$AuthStateViewModel;

abstract class _AuthStateViewModelBase with Store {
  _AuthStateViewModelBase(this._preferences);

  final SharedPreferences _preferences;

  @observable
  bool isLoggedIn = false;

  void updateLoginStatus() {
    isLoggedIn = _preferences.getBool('_is_logged_in') ?? false;
  }
}

