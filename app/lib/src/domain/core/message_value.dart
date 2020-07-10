/*
 * Copyright 2020 Pedro Massango. All rights reserved.
 * Created by Pedro Massango on 10/7/2020.
 */

import 'package:app/src/domain/core/entity.dart';
import 'package:app/src/domain/core/value_objects/unique_id.dart';

class MessageValue extends Entity {
  @override
  final UniqueId id;
  final UniqueId messageId;
  final String value;

  MessageValue({
    this.messageId,
    this.value,
  }) : id = UniqueId.fromString(value);

  @override
  bool operator ==(Object o) {
    return identical(this, o) ||
    o is MessageValue && id == o.id && messageId == o.messageId &&
      value == o.value;
  }

  @override
  int get hashCode => id.hashCode ^ messageId.hashCode ^ value.hashCode;

}
