/*
 * Copyright 2020 Pedro Massango. All rights reserved.
 * Created by Pedro Massango on 5/7/2020.
 */

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$AuthFailureTearOff {
  const _$AuthFailureTearOff();

  NetworkError networkError() {
    return const NetworkError();
  }

  _AuthCanceled authCanceled() {
    return const _AuthCanceled();
  }
}

// ignore: unused_element
const $AuthFailure = _$AuthFailureTearOff();

mixin _$AuthFailure {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result networkError(),
    @required Result authCanceled(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result networkError(),
    Result authCanceled(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result networkError(NetworkError value),
    @required Result authCanceled(_AuthCanceled value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result networkError(NetworkError value),
    Result authCanceled(_AuthCanceled value),
    @required Result orElse(),
  });
}

abstract class $AuthFailureCopyWith<$Res> {
  factory $AuthFailureCopyWith(
          AuthFailure value, $Res Function(AuthFailure) then) =
      _$AuthFailureCopyWithImpl<$Res>;
}

class _$AuthFailureCopyWithImpl<$Res> implements $AuthFailureCopyWith<$Res> {
  _$AuthFailureCopyWithImpl(this._value, this._then);

  final AuthFailure _value;
  // ignore: unused_field
  final $Res Function(AuthFailure) _then;
}

abstract class $NetworkErrorCopyWith<$Res> {
  factory $NetworkErrorCopyWith(
          NetworkError value, $Res Function(NetworkError) then) =
      _$NetworkErrorCopyWithImpl<$Res>;
}

class _$NetworkErrorCopyWithImpl<$Res> extends _$AuthFailureCopyWithImpl<$Res>
    implements $NetworkErrorCopyWith<$Res> {
  _$NetworkErrorCopyWithImpl(
      NetworkError _value, $Res Function(NetworkError) _then)
      : super(_value, (v) => _then(v as NetworkError));

  @override
  NetworkError get _value => super._value as NetworkError;
}

class _$NetworkError implements NetworkError {
  const _$NetworkError();

  @override
  String toString() {
    return 'AuthFailure.networkError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is NetworkError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result networkError(),
    @required Result authCanceled(),
  }) {
    assert(networkError != null);
    assert(authCanceled != null);
    return networkError();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result networkError(),
    Result authCanceled(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (networkError != null) {
      return networkError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result networkError(NetworkError value),
    @required Result authCanceled(_AuthCanceled value),
  }) {
    assert(networkError != null);
    assert(authCanceled != null);
    return networkError(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result networkError(NetworkError value),
    Result authCanceled(_AuthCanceled value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (networkError != null) {
      return networkError(this);
    }
    return orElse();
  }
}

abstract class NetworkError implements AuthFailure {
  const factory NetworkError() = _$NetworkError;
}

abstract class _$AuthCanceledCopyWith<$Res> {
  factory _$AuthCanceledCopyWith(
          _AuthCanceled value, $Res Function(_AuthCanceled) then) =
      __$AuthCanceledCopyWithImpl<$Res>;
}

class __$AuthCanceledCopyWithImpl<$Res> extends _$AuthFailureCopyWithImpl<$Res>
    implements _$AuthCanceledCopyWith<$Res> {
  __$AuthCanceledCopyWithImpl(
      _AuthCanceled _value, $Res Function(_AuthCanceled) _then)
      : super(_value, (v) => _then(v as _AuthCanceled));

  @override
  _AuthCanceled get _value => super._value as _AuthCanceled;
}

class _$_AuthCanceled implements _AuthCanceled {
  const _$_AuthCanceled();

  @override
  String toString() {
    return 'AuthFailure.authCanceled()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _AuthCanceled);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result networkError(),
    @required Result authCanceled(),
  }) {
    assert(networkError != null);
    assert(authCanceled != null);
    return authCanceled();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result networkError(),
    Result authCanceled(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (authCanceled != null) {
      return authCanceled();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result networkError(NetworkError value),
    @required Result authCanceled(_AuthCanceled value),
  }) {
    assert(networkError != null);
    assert(authCanceled != null);
    return authCanceled(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result networkError(NetworkError value),
    Result authCanceled(_AuthCanceled value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (authCanceled != null) {
      return authCanceled(this);
    }
    return orElse();
  }
}

abstract class _AuthCanceled implements AuthFailure {
  const factory _AuthCanceled() = _$_AuthCanceled;
}

class _$UserFailureTearOff {
  const _$UserFailureTearOff();

  _UserNotFound userNotFound() {
    return const _UserNotFound();
  }
}

// ignore: unused_element
const $UserFailure = _$UserFailureTearOff();

mixin _$UserFailure {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result userNotFound(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result userNotFound(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result userNotFound(_UserNotFound value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result userNotFound(_UserNotFound value),
    @required Result orElse(),
  });
}

abstract class $UserFailureCopyWith<$Res> {
  factory $UserFailureCopyWith(
          UserFailure value, $Res Function(UserFailure) then) =
      _$UserFailureCopyWithImpl<$Res>;
}

class _$UserFailureCopyWithImpl<$Res> implements $UserFailureCopyWith<$Res> {
  _$UserFailureCopyWithImpl(this._value, this._then);

  final UserFailure _value;
  // ignore: unused_field
  final $Res Function(UserFailure) _then;
}

abstract class _$UserNotFoundCopyWith<$Res> {
  factory _$UserNotFoundCopyWith(
          _UserNotFound value, $Res Function(_UserNotFound) then) =
      __$UserNotFoundCopyWithImpl<$Res>;
}

class __$UserNotFoundCopyWithImpl<$Res> extends _$UserFailureCopyWithImpl<$Res>
    implements _$UserNotFoundCopyWith<$Res> {
  __$UserNotFoundCopyWithImpl(
      _UserNotFound _value, $Res Function(_UserNotFound) _then)
      : super(_value, (v) => _then(v as _UserNotFound));

  @override
  _UserNotFound get _value => super._value as _UserNotFound;
}

class _$_UserNotFound implements _UserNotFound {
  const _$_UserNotFound();

  @override
  String toString() {
    return 'UserFailure.userNotFound()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _UserNotFound);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result userNotFound(),
  }) {
    assert(userNotFound != null);
    return userNotFound();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result userNotFound(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (userNotFound != null) {
      return userNotFound();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result userNotFound(_UserNotFound value),
  }) {
    assert(userNotFound != null);
    return userNotFound(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result userNotFound(_UserNotFound value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (userNotFound != null) {
      return userNotFound(this);
    }
    return orElse();
  }
}

abstract class _UserNotFound implements UserFailure {
  const factory _UserNotFound() = _$_UserNotFound;
}

class _$NetworkFailureTearOff {
  const _$NetworkFailureTearOff();

  _NetworkError networkError() {
    return const _NetworkError();
  }
}

// ignore: unused_element
const $NetworkFailure = _$NetworkFailureTearOff();

mixin _$NetworkFailure {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result networkError(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result networkError(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result networkError(_NetworkError value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result networkError(_NetworkError value),
    @required Result orElse(),
  });
}

abstract class $NetworkFailureCopyWith<$Res> {
  factory $NetworkFailureCopyWith(
          NetworkFailure value, $Res Function(NetworkFailure) then) =
      _$NetworkFailureCopyWithImpl<$Res>;
}

class _$NetworkFailureCopyWithImpl<$Res>
    implements $NetworkFailureCopyWith<$Res> {
  _$NetworkFailureCopyWithImpl(this._value, this._then);

  final NetworkFailure _value;
  // ignore: unused_field
  final $Res Function(NetworkFailure) _then;
}

abstract class _$NetworkErrorCopyWith<$Res> {
  factory _$NetworkErrorCopyWith(
          _NetworkError value, $Res Function(_NetworkError) then) =
      __$NetworkErrorCopyWithImpl<$Res>;
}

class __$NetworkErrorCopyWithImpl<$Res>
    extends _$NetworkFailureCopyWithImpl<$Res>
    implements _$NetworkErrorCopyWith<$Res> {
  __$NetworkErrorCopyWithImpl(
      _NetworkError _value, $Res Function(_NetworkError) _then)
      : super(_value, (v) => _then(v as _NetworkError));

  @override
  _NetworkError get _value => super._value as _NetworkError;
}

class _$_NetworkError implements _NetworkError {
  const _$_NetworkError();

  @override
  String toString() {
    return 'NetworkFailure.networkError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _NetworkError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result networkError(),
  }) {
    assert(networkError != null);
    return networkError();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result networkError(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (networkError != null) {
      return networkError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result networkError(_NetworkError value),
  }) {
    assert(networkError != null);
    return networkError(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result networkError(_NetworkError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (networkError != null) {
      return networkError(this);
    }
    return orElse();
  }
}

abstract class _NetworkError implements NetworkFailure {
  const factory _NetworkError() = _$_NetworkError;
}
