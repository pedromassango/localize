/*
 * Copyright 2020 Pedro Massango. All rights reserved.
 * Created by Pedro Massango on 1/7/2020.
 */

import 'package:app/src/domain/core/exceptions.dart';
import 'package:app/src/domain/core/value_objects/common_interfaces.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import 'value_failure.dart';

@immutable
abstract class ValueObject<T extends Object> implements Validator {
  const ValueObject();

  Either<ValueFailure<T>, T> get value;

  T getOrThrow() => value.fold((f) {
        throw UnexpectedValueError(f);
      },
    id,
  );

  T getOrElse(T defaultValue) {
    return value.getOrElse(() => defaultValue);
  }

  Either<ValueFailure<T>, Unit> get failureOrUnit => value.fold(
        left,
        (_) => right(unit),
      );

  @override
  bool isValid() => value.isRight();

  @override
  String toString() => 'ValueObject($value)';
}
