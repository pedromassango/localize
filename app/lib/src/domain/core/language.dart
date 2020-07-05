/*
 * Copyright 2020 Pedro Massango. All rights reserved.
 * Created by Pedro Massango on 5/7/2020.
 */

import 'package:app/src/domain/core/entity.dart';
import 'package:app/src/domain/core/value_objects/unique_id.dart';
import 'package:flutter/foundation.dart';

class Language extends Entity {
  final String code;
  final String name;
  final int messagesCount;

  @required
  UniqueId get id => UniqueId.fromString(code);

  const Language({
    @required this.code,
    @required this.name,
    this.messagesCount = 15,
  });

  String get nameAndCode => '$name - ${code.toUpperCase()}';
}