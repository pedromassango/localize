/*
 * Copyright 2020 Pedro Massango. All rights reserved.
 * Created by Pedro Massango on 3/7/2020.
 */

import 'package:app/src/domain/core/entity.dart';
import 'package:app/src/domain/core/value_objects/unique_id.dart';
import 'package:flutter/foundation.dart';

class Language extends Entity {
  final String code;
  final String name;

  @required
  final UniqueId id;

  Language({
    this.code,
    this.name,
  }) : id = UniqueId.fromString(code);
}