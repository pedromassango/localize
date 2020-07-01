/*
 * Copyright 2020 Pedro Massango. All rights reserved.
 * Created by Pedro Massango on 1/7/2020.
 */

import 'value_objects/value_failure.dart';

class UnexpectedValueError extends Error {
  UnexpectedValueError(this.valueFailure) : super();

  final ValueFailure valueFailure;

  @override
  String toString() {
    const explanation =
        'Encountered a ValueFailure at an unrecoverable point. Terminating.';
    return '$explanation Failure was: $valueFailure';
  }
}
