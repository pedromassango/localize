/*
 * Copyright 2020 Pedro Massango. All rights reserved.
 * Created by Pedro Massango on 7/7/2020.
 */

import 'package:app/src/domain/core/entity.dart';
import 'package:app/src/domain/core/value_objects/unique_id.dart';

enum MessageType { single, plural }

class Message extends Entity {
  @override
  final UniqueId id;
  final UniqueId projectId;
  final String name;
  final String description;

  Message({
    this.projectId,
    this.name,
    this.description,
  }) : assert(name != null && name.isNotEmpty, 'name must not be null or empty'),
       assert(!name.contains(' '), 'name must not contains spaces'),
       assert(description != null),
       assert(projectId != null),
        id = UniqueId.fromString(name);

  factory Message.withEmptyDescription(String name, UniqueId projectId) {
    return Message(
      name: name,
      projectId: projectId,
      description: ''
    );
  }

  bool get hasDescription => description.isNotEmpty;
}
