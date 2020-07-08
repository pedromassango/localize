/*
 * Copyright 2020 Pedro Massango. All rights reserved.
 * Created by Pedro Massango on 8/7/2020.
 */

import 'package:app/src/domain/core/entity.dart';
import 'package:app/src/domain/core/value_objects/unique_id.dart';
import 'package:flutter/foundation.dart';

class Project extends Entity {
  @override
  final UniqueId id;
  final String name;

  Project({
    @required this.id,
    @required this.name,
  });

  @override
  bool operator ==(Object o) {
    return identical(this, o) ||
      o is Project && id == o.id && name == o.name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;

}
