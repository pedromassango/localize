/*
 * Copyright 2020 Pedro Massango. All rights reserved.
 * Created by Pedro Massango on 1/7/2020.
 */

import 'package:freezed_annotation/freezed_annotation.dart';

part 'value_failure.freezed.dart';

@freezed
abstract class ValueFailure<T> with _$ValueFailure<T> {
  const factory ValueFailure.numberTooShort({T failedValue}) = _C1<T>;
  const factory ValueFailure.invalidPhoneNumber({T failedValue}) = _C2<T>;

  const factory ValueFailure.invalidPassword([T failedValue]) = _C3<T>;

  const factory ValueFailure.passwordTooShort(T failedValue) = _C5<T>;

  const factory ValueFailure.invalidCountryCode([T failedValue]) = _C6<T>;

  const factory ValueFailure.amountNotAllowed() = _C7<T>;
}
