/*
 * Copyright 2020 Pedro Massango. All rights reserved.
 * Created by Pedro Massango on 10/7/2020.
 */

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'auth_state_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$AuthStateTearOff {
  const _$AuthStateTearOff();

  _AuthState call(
      {bool isLoggedIn = false,
      UserFailure userFailure,
      AuthFailure authFailure,
      User user}) {
    return _AuthState(
      isLoggedIn: isLoggedIn,
      userFailure: userFailure,
      authFailure: authFailure,
      user: user,
    );
  }
}

// ignore: unused_element
const $AuthState = _$AuthStateTearOff();

mixin _$AuthState {
  bool get isLoggedIn;
  UserFailure get userFailure;
  AuthFailure get authFailure;
  User get user;

  $AuthStateCopyWith<AuthState> get copyWith;
}

abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res>;
  $Res call(
      {bool isLoggedIn,
      UserFailure userFailure,
      AuthFailure authFailure,
      User user});

  $UserFailureCopyWith<$Res> get userFailure;
  $AuthFailureCopyWith<$Res> get authFailure;
}

class _$AuthStateCopyWithImpl<$Res> implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  final AuthState _value;
  // ignore: unused_field
  final $Res Function(AuthState) _then;

  @override
  $Res call({
    Object isLoggedIn = freezed,
    Object userFailure = freezed,
    Object authFailure = freezed,
    Object user = freezed,
  }) {
    return _then(_value.copyWith(
      isLoggedIn:
          isLoggedIn == freezed ? _value.isLoggedIn : isLoggedIn as bool,
      userFailure: userFailure == freezed
          ? _value.userFailure
          : userFailure as UserFailure,
      authFailure: authFailure == freezed
          ? _value.authFailure
          : authFailure as AuthFailure,
      user: user == freezed ? _value.user : user as User,
    ));
  }

  @override
  $UserFailureCopyWith<$Res> get userFailure {
    if (_value.userFailure == null) {
      return null;
    }
    return $UserFailureCopyWith<$Res>(_value.userFailure, (value) {
      return _then(_value.copyWith(userFailure: value));
    });
  }

  @override
  $AuthFailureCopyWith<$Res> get authFailure {
    if (_value.authFailure == null) {
      return null;
    }
    return $AuthFailureCopyWith<$Res>(_value.authFailure, (value) {
      return _then(_value.copyWith(authFailure: value));
    });
  }
}

abstract class _$AuthStateCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$AuthStateCopyWith(
          _AuthState value, $Res Function(_AuthState) then) =
      __$AuthStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isLoggedIn,
      UserFailure userFailure,
      AuthFailure authFailure,
      User user});

  @override
  $UserFailureCopyWith<$Res> get userFailure;
  @override
  $AuthFailureCopyWith<$Res> get authFailure;
}

class __$AuthStateCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements _$AuthStateCopyWith<$Res> {
  __$AuthStateCopyWithImpl(_AuthState _value, $Res Function(_AuthState) _then)
      : super(_value, (v) => _then(v as _AuthState));

  @override
  _AuthState get _value => super._value as _AuthState;

  @override
  $Res call({
    Object isLoggedIn = freezed,
    Object userFailure = freezed,
    Object authFailure = freezed,
    Object user = freezed,
  }) {
    return _then(_AuthState(
      isLoggedIn:
          isLoggedIn == freezed ? _value.isLoggedIn : isLoggedIn as bool,
      userFailure: userFailure == freezed
          ? _value.userFailure
          : userFailure as UserFailure,
      authFailure: authFailure == freezed
          ? _value.authFailure
          : authFailure as AuthFailure,
      user: user == freezed ? _value.user : user as User,
    ));
  }
}

class _$_AuthState with DiagnosticableTreeMixin implements _AuthState {
  _$_AuthState(
      {this.isLoggedIn = false, this.userFailure, this.authFailure, this.user})
      : assert(isLoggedIn != null);

  @JsonKey(defaultValue: false)
  @override
  final bool isLoggedIn;
  @override
  final UserFailure userFailure;
  @override
  final AuthFailure authFailure;
  @override
  final User user;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthState(isLoggedIn: $isLoggedIn, userFailure: $userFailure, authFailure: $authFailure, user: $user)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthState'))
      ..add(DiagnosticsProperty('isLoggedIn', isLoggedIn))
      ..add(DiagnosticsProperty('userFailure', userFailure))
      ..add(DiagnosticsProperty('authFailure', authFailure))
      ..add(DiagnosticsProperty('user', user));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AuthState &&
            (identical(other.isLoggedIn, isLoggedIn) ||
                const DeepCollectionEquality()
                    .equals(other.isLoggedIn, isLoggedIn)) &&
            (identical(other.userFailure, userFailure) ||
                const DeepCollectionEquality()
                    .equals(other.userFailure, userFailure)) &&
            (identical(other.authFailure, authFailure) ||
                const DeepCollectionEquality()
                    .equals(other.authFailure, authFailure)) &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isLoggedIn) ^
      const DeepCollectionEquality().hash(userFailure) ^
      const DeepCollectionEquality().hash(authFailure) ^
      const DeepCollectionEquality().hash(user);

  @override
  _$AuthStateCopyWith<_AuthState> get copyWith =>
      __$AuthStateCopyWithImpl<_AuthState>(this, _$identity);
}

abstract class _AuthState implements AuthState {
  factory _AuthState(
      {bool isLoggedIn,
      UserFailure userFailure,
      AuthFailure authFailure,
      User user}) = _$_AuthState;

  @override
  bool get isLoggedIn;
  @override
  UserFailure get userFailure;
  @override
  AuthFailure get authFailure;
  @override
  User get user;
  @override
  _$AuthStateCopyWith<_AuthState> get copyWith;
}
