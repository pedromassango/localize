/*
 * Copyright 2020 Pedro Massango. All rights reserved.
 * Created by Pedro Massango on 1/7/2020.
 */

import 'package:app/src/domain/core/value_objects/value_object.dart';
import 'package:dartz/dartz.dart';
import 'package:uuid/uuid.dart';

import 'value_failure.dart';

class UniqueId extends ValueObject<String> {
  /// Used with strings we trust are unique, such as database IDs.
  factory UniqueId.fromString(String value) {
    assert(value != null);
    assert(value.isNotEmpty);
    return UniqueId._(right(value));
  }

  /// Generate a new unique id and return as a valid value
  factory UniqueId.generate() {
    return UniqueId._(right(Uuid().v1()));
  }

  const UniqueId._(this.value);

  final Either<ValueFailure<String>, String> value;
}
