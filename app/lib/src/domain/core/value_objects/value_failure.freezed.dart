/*
 * Copyright 2020 Pedro Massango. All rights reserved.
 * Created by Pedro Massango on 5/7/2020.
 */

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'value_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$ValueFailureTearOff {
  const _$ValueFailureTearOff();

  _C1<T> numberTooShort<T>({T failedValue}) {
    return _C1<T>(
      failedValue: failedValue,
    );
  }

  _C2<T> invalidPhoneNumber<T>({T failedValue}) {
    return _C2<T>(
      failedValue: failedValue,
    );
  }

  _C3<T> invalidPassword<T>([T failedValue]) {
    return _C3<T>(
      failedValue,
    );
  }

  _C5<T> passwordTooShort<T>(T failedValue) {
    return _C5<T>(
      failedValue,
    );
  }

  _C6<T> invalidCountryCode<T>([T failedValue]) {
    return _C6<T>(
      failedValue,
    );
  }

  _C7<T> amountNotAllowed<T>() {
    return _C7<T>();
  }
}

// ignore: unused_element
const $ValueFailure = _$ValueFailureTearOff();

mixin _$ValueFailure<T> {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result numberTooShort(T failedValue),
    @required Result invalidPhoneNumber(T failedValue),
    @required Result invalidPassword(T failedValue),
    @required Result passwordTooShort(T failedValue),
    @required Result invalidCountryCode(T failedValue),
    @required Result amountNotAllowed(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result numberTooShort(T failedValue),
    Result invalidPhoneNumber(T failedValue),
    Result invalidPassword(T failedValue),
    Result passwordTooShort(T failedValue),
    Result invalidCountryCode(T failedValue),
    Result amountNotAllowed(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result numberTooShort(_C1<T> value),
    @required Result invalidPhoneNumber(_C2<T> value),
    @required Result invalidPassword(_C3<T> value),
    @required Result passwordTooShort(_C5<T> value),
    @required Result invalidCountryCode(_C6<T> value),
    @required Result amountNotAllowed(_C7<T> value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result numberTooShort(_C1<T> value),
    Result invalidPhoneNumber(_C2<T> value),
    Result invalidPassword(_C3<T> value),
    Result passwordTooShort(_C5<T> value),
    Result invalidCountryCode(_C6<T> value),
    Result amountNotAllowed(_C7<T> value),
    @required Result orElse(),
  });
}

abstract class $ValueFailureCopyWith<T, $Res> {
  factory $ValueFailureCopyWith(
          ValueFailure<T> value, $Res Function(ValueFailure<T>) then) =
      _$ValueFailureCopyWithImpl<T, $Res>;
}

class _$ValueFailureCopyWithImpl<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  _$ValueFailureCopyWithImpl(this._value, this._then);

  final ValueFailure<T> _value;
  // ignore: unused_field
  final $Res Function(ValueFailure<T>) _then;
}

abstract class _$C1CopyWith<T, $Res> {
  factory _$C1CopyWith(_C1<T> value, $Res Function(_C1<T>) then) =
      __$C1CopyWithImpl<T, $Res>;
  $Res call({T failedValue});
}

class __$C1CopyWithImpl<T, $Res> extends _$ValueFailureCopyWithImpl<T, $Res>
    implements _$C1CopyWith<T, $Res> {
  __$C1CopyWithImpl(_C1<T> _value, $Res Function(_C1<T>) _then)
      : super(_value, (v) => _then(v as _C1<T>));

  @override
  _C1<T> get _value => super._value as _C1<T>;

  @override
  $Res call({
    Object failedValue = freezed,
  }) {
    return _then(_C1<T>(
      failedValue:
          failedValue == freezed ? _value.failedValue : failedValue as T,
    ));
  }
}

class _$_C1<T> implements _C1<T> {
  const _$_C1({this.failedValue});

  @override
  final T failedValue;

  @override
  String toString() {
    return 'ValueFailure<$T>.numberTooShort(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _C1<T> &&
            (identical(other.failedValue, failedValue) ||
                const DeepCollectionEquality()
                    .equals(other.failedValue, failedValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failedValue);

  @override
  _$C1CopyWith<T, _C1<T>> get copyWith =>
      __$C1CopyWithImpl<T, _C1<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result numberTooShort(T failedValue),
    @required Result invalidPhoneNumber(T failedValue),
    @required Result invalidPassword(T failedValue),
    @required Result passwordTooShort(T failedValue),
    @required Result invalidCountryCode(T failedValue),
    @required Result amountNotAllowed(),
  }) {
    assert(numberTooShort != null);
    assert(invalidPhoneNumber != null);
    assert(invalidPassword != null);
    assert(passwordTooShort != null);
    assert(invalidCountryCode != null);
    assert(amountNotAllowed != null);
    return numberTooShort(failedValue);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result numberTooShort(T failedValue),
    Result invalidPhoneNumber(T failedValue),
    Result invalidPassword(T failedValue),
    Result passwordTooShort(T failedValue),
    Result invalidCountryCode(T failedValue),
    Result amountNotAllowed(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (numberTooShort != null) {
      return numberTooShort(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result numberTooShort(_C1<T> value),
    @required Result invalidPhoneNumber(_C2<T> value),
    @required Result invalidPassword(_C3<T> value),
    @required Result passwordTooShort(_C5<T> value),
    @required Result invalidCountryCode(_C6<T> value),
    @required Result amountNotAllowed(_C7<T> value),
  }) {
    assert(numberTooShort != null);
    assert(invalidPhoneNumber != null);
    assert(invalidPassword != null);
    assert(passwordTooShort != null);
    assert(invalidCountryCode != null);
    assert(amountNotAllowed != null);
    return numberTooShort(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result numberTooShort(_C1<T> value),
    Result invalidPhoneNumber(_C2<T> value),
    Result invalidPassword(_C3<T> value),
    Result passwordTooShort(_C5<T> value),
    Result invalidCountryCode(_C6<T> value),
    Result amountNotAllowed(_C7<T> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (numberTooShort != null) {
      return numberTooShort(this);
    }
    return orElse();
  }
}

abstract class _C1<T> implements ValueFailure<T> {
  const factory _C1({T failedValue}) = _$_C1<T>;

  T get failedValue;
  _$C1CopyWith<T, _C1<T>> get copyWith;
}

abstract class _$C2CopyWith<T, $Res> {
  factory _$C2CopyWith(_C2<T> value, $Res Function(_C2<T>) then) =
      __$C2CopyWithImpl<T, $Res>;
  $Res call({T failedValue});
}

class __$C2CopyWithImpl<T, $Res> extends _$ValueFailureCopyWithImpl<T, $Res>
    implements _$C2CopyWith<T, $Res> {
  __$C2CopyWithImpl(_C2<T> _value, $Res Function(_C2<T>) _then)
      : super(_value, (v) => _then(v as _C2<T>));

  @override
  _C2<T> get _value => super._value as _C2<T>;

  @override
  $Res call({
    Object failedValue = freezed,
  }) {
    return _then(_C2<T>(
      failedValue:
          failedValue == freezed ? _value.failedValue : failedValue as T,
    ));
  }
}

class _$_C2<T> implements _C2<T> {
  const _$_C2({this.failedValue});

  @override
  final T failedValue;

  @override
  String toString() {
    return 'ValueFailure<$T>.invalidPhoneNumber(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _C2<T> &&
            (identical(other.failedValue, failedValue) ||
                const DeepCollectionEquality()
                    .equals(other.failedValue, failedValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failedValue);

  @override
  _$C2CopyWith<T, _C2<T>> get copyWith =>
      __$C2CopyWithImpl<T, _C2<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result numberTooShort(T failedValue),
    @required Result invalidPhoneNumber(T failedValue),
    @required Result invalidPassword(T failedValue),
    @required Result passwordTooShort(T failedValue),
    @required Result invalidCountryCode(T failedValue),
    @required Result amountNotAllowed(),
  }) {
    assert(numberTooShort != null);
    assert(invalidPhoneNumber != null);
    assert(invalidPassword != null);
    assert(passwordTooShort != null);
    assert(invalidCountryCode != null);
    assert(amountNotAllowed != null);
    return invalidPhoneNumber(failedValue);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result numberTooShort(T failedValue),
    Result invalidPhoneNumber(T failedValue),
    Result invalidPassword(T failedValue),
    Result passwordTooShort(T failedValue),
    Result invalidCountryCode(T failedValue),
    Result amountNotAllowed(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (invalidPhoneNumber != null) {
      return invalidPhoneNumber(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result numberTooShort(_C1<T> value),
    @required Result invalidPhoneNumber(_C2<T> value),
    @required Result invalidPassword(_C3<T> value),
    @required Result passwordTooShort(_C5<T> value),
    @required Result invalidCountryCode(_C6<T> value),
    @required Result amountNotAllowed(_C7<T> value),
  }) {
    assert(numberTooShort != null);
    assert(invalidPhoneNumber != null);
    assert(invalidPassword != null);
    assert(passwordTooShort != null);
    assert(invalidCountryCode != null);
    assert(amountNotAllowed != null);
    return invalidPhoneNumber(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result numberTooShort(_C1<T> value),
    Result invalidPhoneNumber(_C2<T> value),
    Result invalidPassword(_C3<T> value),
    Result passwordTooShort(_C5<T> value),
    Result invalidCountryCode(_C6<T> value),
    Result amountNotAllowed(_C7<T> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (invalidPhoneNumber != null) {
      return invalidPhoneNumber(this);
    }
    return orElse();
  }
}

abstract class _C2<T> implements ValueFailure<T> {
  const factory _C2({T failedValue}) = _$_C2<T>;

  T get failedValue;
  _$C2CopyWith<T, _C2<T>> get copyWith;
}

abstract class _$C3CopyWith<T, $Res> {
  factory _$C3CopyWith(_C3<T> value, $Res Function(_C3<T>) then) =
      __$C3CopyWithImpl<T, $Res>;
  $Res call({T failedValue});
}

class __$C3CopyWithImpl<T, $Res> extends _$ValueFailureCopyWithImpl<T, $Res>
    implements _$C3CopyWith<T, $Res> {
  __$C3CopyWithImpl(_C3<T> _value, $Res Function(_C3<T>) _then)
      : super(_value, (v) => _then(v as _C3<T>));

  @override
  _C3<T> get _value => super._value as _C3<T>;

  @override
  $Res call({
    Object failedValue = freezed,
  }) {
    return _then(_C3<T>(
      failedValue == freezed ? _value.failedValue : failedValue as T,
    ));
  }
}

class _$_C3<T> implements _C3<T> {
  const _$_C3([this.failedValue]);

  @override
  final T failedValue;

  @override
  String toString() {
    return 'ValueFailure<$T>.invalidPassword(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _C3<T> &&
            (identical(other.failedValue, failedValue) ||
                const DeepCollectionEquality()
                    .equals(other.failedValue, failedValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failedValue);

  @override
  _$C3CopyWith<T, _C3<T>> get copyWith =>
      __$C3CopyWithImpl<T, _C3<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result numberTooShort(T failedValue),
    @required Result invalidPhoneNumber(T failedValue),
    @required Result invalidPassword(T failedValue),
    @required Result passwordTooShort(T failedValue),
    @required Result invalidCountryCode(T failedValue),
    @required Result amountNotAllowed(),
  }) {
    assert(numberTooShort != null);
    assert(invalidPhoneNumber != null);
    assert(invalidPassword != null);
    assert(passwordTooShort != null);
    assert(invalidCountryCode != null);
    assert(amountNotAllowed != null);
    return invalidPassword(failedValue);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result numberTooShort(T failedValue),
    Result invalidPhoneNumber(T failedValue),
    Result invalidPassword(T failedValue),
    Result passwordTooShort(T failedValue),
    Result invalidCountryCode(T failedValue),
    Result amountNotAllowed(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (invalidPassword != null) {
      return invalidPassword(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result numberTooShort(_C1<T> value),
    @required Result invalidPhoneNumber(_C2<T> value),
    @required Result invalidPassword(_C3<T> value),
    @required Result passwordTooShort(_C5<T> value),
    @required Result invalidCountryCode(_C6<T> value),
    @required Result amountNotAllowed(_C7<T> value),
  }) {
    assert(numberTooShort != null);
    assert(invalidPhoneNumber != null);
    assert(invalidPassword != null);
    assert(passwordTooShort != null);
    assert(invalidCountryCode != null);
    assert(amountNotAllowed != null);
    return invalidPassword(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result numberTooShort(_C1<T> value),
    Result invalidPhoneNumber(_C2<T> value),
    Result invalidPassword(_C3<T> value),
    Result passwordTooShort(_C5<T> value),
    Result invalidCountryCode(_C6<T> value),
    Result amountNotAllowed(_C7<T> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (invalidPassword != null) {
      return invalidPassword(this);
    }
    return orElse();
  }
}

abstract class _C3<T> implements ValueFailure<T> {
  const factory _C3([T failedValue]) = _$_C3<T>;

  T get failedValue;
  _$C3CopyWith<T, _C3<T>> get copyWith;
}

abstract class _$C5CopyWith<T, $Res> {
  factory _$C5CopyWith(_C5<T> value, $Res Function(_C5<T>) then) =
      __$C5CopyWithImpl<T, $Res>;
  $Res call({T failedValue});
}

class __$C5CopyWithImpl<T, $Res> extends _$ValueFailureCopyWithImpl<T, $Res>
    implements _$C5CopyWith<T, $Res> {
  __$C5CopyWithImpl(_C5<T> _value, $Res Function(_C5<T>) _then)
      : super(_value, (v) => _then(v as _C5<T>));

  @override
  _C5<T> get _value => super._value as _C5<T>;

  @override
  $Res call({
    Object failedValue = freezed,
  }) {
    return _then(_C5<T>(
      failedValue == freezed ? _value.failedValue : failedValue as T,
    ));
  }
}

class _$_C5<T> implements _C5<T> {
  const _$_C5(this.failedValue) : assert(failedValue != null);

  @override
  final T failedValue;

  @override
  String toString() {
    return 'ValueFailure<$T>.passwordTooShort(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _C5<T> &&
            (identical(other.failedValue, failedValue) ||
                const DeepCollectionEquality()
                    .equals(other.failedValue, failedValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failedValue);

  @override
  _$C5CopyWith<T, _C5<T>> get copyWith =>
      __$C5CopyWithImpl<T, _C5<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result numberTooShort(T failedValue),
    @required Result invalidPhoneNumber(T failedValue),
    @required Result invalidPassword(T failedValue),
    @required Result passwordTooShort(T failedValue),
    @required Result invalidCountryCode(T failedValue),
    @required Result amountNotAllowed(),
  }) {
    assert(numberTooShort != null);
    assert(invalidPhoneNumber != null);
    assert(invalidPassword != null);
    assert(passwordTooShort != null);
    assert(invalidCountryCode != null);
    assert(amountNotAllowed != null);
    return passwordTooShort(failedValue);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result numberTooShort(T failedValue),
    Result invalidPhoneNumber(T failedValue),
    Result invalidPassword(T failedValue),
    Result passwordTooShort(T failedValue),
    Result invalidCountryCode(T failedValue),
    Result amountNotAllowed(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (passwordTooShort != null) {
      return passwordTooShort(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result numberTooShort(_C1<T> value),
    @required Result invalidPhoneNumber(_C2<T> value),
    @required Result invalidPassword(_C3<T> value),
    @required Result passwordTooShort(_C5<T> value),
    @required Result invalidCountryCode(_C6<T> value),
    @required Result amountNotAllowed(_C7<T> value),
  }) {
    assert(numberTooShort != null);
    assert(invalidPhoneNumber != null);
    assert(invalidPassword != null);
    assert(passwordTooShort != null);
    assert(invalidCountryCode != null);
    assert(amountNotAllowed != null);
    return passwordTooShort(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result numberTooShort(_C1<T> value),
    Result invalidPhoneNumber(_C2<T> value),
    Result invalidPassword(_C3<T> value),
    Result passwordTooShort(_C5<T> value),
    Result invalidCountryCode(_C6<T> value),
    Result amountNotAllowed(_C7<T> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (passwordTooShort != null) {
      return passwordTooShort(this);
    }
    return orElse();
  }
}

abstract class _C5<T> implements ValueFailure<T> {
  const factory _C5(T failedValue) = _$_C5<T>;

  T get failedValue;
  _$C5CopyWith<T, _C5<T>> get copyWith;
}

abstract class _$C6CopyWith<T, $Res> {
  factory _$C6CopyWith(_C6<T> value, $Res Function(_C6<T>) then) =
      __$C6CopyWithImpl<T, $Res>;
  $Res call({T failedValue});
}

class __$C6CopyWithImpl<T, $Res> extends _$ValueFailureCopyWithImpl<T, $Res>
    implements _$C6CopyWith<T, $Res> {
  __$C6CopyWithImpl(_C6<T> _value, $Res Function(_C6<T>) _then)
      : super(_value, (v) => _then(v as _C6<T>));

  @override
  _C6<T> get _value => super._value as _C6<T>;

  @override
  $Res call({
    Object failedValue = freezed,
  }) {
    return _then(_C6<T>(
      failedValue == freezed ? _value.failedValue : failedValue as T,
    ));
  }
}

class _$_C6<T> implements _C6<T> {
  const _$_C6([this.failedValue]);

  @override
  final T failedValue;

  @override
  String toString() {
    return 'ValueFailure<$T>.invalidCountryCode(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _C6<T> &&
            (identical(other.failedValue, failedValue) ||
                const DeepCollectionEquality()
                    .equals(other.failedValue, failedValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failedValue);

  @override
  _$C6CopyWith<T, _C6<T>> get copyWith =>
      __$C6CopyWithImpl<T, _C6<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result numberTooShort(T failedValue),
    @required Result invalidPhoneNumber(T failedValue),
    @required Result invalidPassword(T failedValue),
    @required Result passwordTooShort(T failedValue),
    @required Result invalidCountryCode(T failedValue),
    @required Result amountNotAllowed(),
  }) {
    assert(numberTooShort != null);
    assert(invalidPhoneNumber != null);
    assert(invalidPassword != null);
    assert(passwordTooShort != null);
    assert(invalidCountryCode != null);
    assert(amountNotAllowed != null);
    return invalidCountryCode(failedValue);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result numberTooShort(T failedValue),
    Result invalidPhoneNumber(T failedValue),
    Result invalidPassword(T failedValue),
    Result passwordTooShort(T failedValue),
    Result invalidCountryCode(T failedValue),
    Result amountNotAllowed(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (invalidCountryCode != null) {
      return invalidCountryCode(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result numberTooShort(_C1<T> value),
    @required Result invalidPhoneNumber(_C2<T> value),
    @required Result invalidPassword(_C3<T> value),
    @required Result passwordTooShort(_C5<T> value),
    @required Result invalidCountryCode(_C6<T> value),
    @required Result amountNotAllowed(_C7<T> value),
  }) {
    assert(numberTooShort != null);
    assert(invalidPhoneNumber != null);
    assert(invalidPassword != null);
    assert(passwordTooShort != null);
    assert(invalidCountryCode != null);
    assert(amountNotAllowed != null);
    return invalidCountryCode(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result numberTooShort(_C1<T> value),
    Result invalidPhoneNumber(_C2<T> value),
    Result invalidPassword(_C3<T> value),
    Result passwordTooShort(_C5<T> value),
    Result invalidCountryCode(_C6<T> value),
    Result amountNotAllowed(_C7<T> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (invalidCountryCode != null) {
      return invalidCountryCode(this);
    }
    return orElse();
  }
}

abstract class _C6<T> implements ValueFailure<T> {
  const factory _C6([T failedValue]) = _$_C6<T>;

  T get failedValue;
  _$C6CopyWith<T, _C6<T>> get copyWith;
}

abstract class _$C7CopyWith<T, $Res> {
  factory _$C7CopyWith(_C7<T> value, $Res Function(_C7<T>) then) =
      __$C7CopyWithImpl<T, $Res>;
}

class __$C7CopyWithImpl<T, $Res> extends _$ValueFailureCopyWithImpl<T, $Res>
    implements _$C7CopyWith<T, $Res> {
  __$C7CopyWithImpl(_C7<T> _value, $Res Function(_C7<T>) _then)
      : super(_value, (v) => _then(v as _C7<T>));

  @override
  _C7<T> get _value => super._value as _C7<T>;
}

class _$_C7<T> implements _C7<T> {
  const _$_C7();

  @override
  String toString() {
    return 'ValueFailure<$T>.amountNotAllowed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _C7<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result numberTooShort(T failedValue),
    @required Result invalidPhoneNumber(T failedValue),
    @required Result invalidPassword(T failedValue),
    @required Result passwordTooShort(T failedValue),
    @required Result invalidCountryCode(T failedValue),
    @required Result amountNotAllowed(),
  }) {
    assert(numberTooShort != null);
    assert(invalidPhoneNumber != null);
    assert(invalidPassword != null);
    assert(passwordTooShort != null);
    assert(invalidCountryCode != null);
    assert(amountNotAllowed != null);
    return amountNotAllowed();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result numberTooShort(T failedValue),
    Result invalidPhoneNumber(T failedValue),
    Result invalidPassword(T failedValue),
    Result passwordTooShort(T failedValue),
    Result invalidCountryCode(T failedValue),
    Result amountNotAllowed(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (amountNotAllowed != null) {
      return amountNotAllowed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result numberTooShort(_C1<T> value),
    @required Result invalidPhoneNumber(_C2<T> value),
    @required Result invalidPassword(_C3<T> value),
    @required Result passwordTooShort(_C5<T> value),
    @required Result invalidCountryCode(_C6<T> value),
    @required Result amountNotAllowed(_C7<T> value),
  }) {
    assert(numberTooShort != null);
    assert(invalidPhoneNumber != null);
    assert(invalidPassword != null);
    assert(passwordTooShort != null);
    assert(invalidCountryCode != null);
    assert(amountNotAllowed != null);
    return amountNotAllowed(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result numberTooShort(_C1<T> value),
    Result invalidPhoneNumber(_C2<T> value),
    Result invalidPassword(_C3<T> value),
    Result passwordTooShort(_C5<T> value),
    Result invalidCountryCode(_C6<T> value),
    Result amountNotAllowed(_C7<T> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (amountNotAllowed != null) {
      return amountNotAllowed(this);
    }
    return orElse();
  }
}

abstract class _C7<T> implements ValueFailure<T> {
  const factory _C7() = _$_C7<T>;
}
