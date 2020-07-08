/*
 * Copyright 2020 Pedro Massango. All rights reserved.
 * Created by Pedro Massango on 8/7/2020.
 */

import 'package:app/src/domain/core/entity.dart';
import 'package:app/src/domain/core/value_objects/unique_id.dart';
import 'package:flutter/foundation.dart';

class Language extends Entity {
  final String code;
  final String name;
  final int messagesCount;

  @required
  final UniqueId id;

  Language({
    @required this.code,
    @required this.name,
    this.messagesCount = 15,
  }) : id = UniqueId.fromString(code);

  String get nameAndCode => '$name - ${code.toUpperCase()}';

  @override
  bool operator ==(Object o) {
    return identical(this, o) || o is Language &&
      id == o.id && code == o.code && name == o.name &&
        messagesCount == o.messagesCount;
  }

  @override
  int get hashCode => code.hashCode ^ name.hashCode ^
  messagesCount.hashCode ^ id.hashCode;
}