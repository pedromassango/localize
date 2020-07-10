/*
 * Copyright 2020 Pedro Massango. All rights reserved.
 * Created by Pedro Massango on 10/7/2020.
 */

import 'package:app/src/domain/core/failures.dart';
import 'package:app/src/domain/core/message.dart';
import 'package:app/src/domain/core/message_value.dart';
import 'package:app/src/domain/core/services/messages_service.dart';
import 'package:app/src/domain/core/value_objects/unique_id.dart';
import 'package:dartz/dartz.dart';

class DefaultMessagesService extends MessagesService {
  @override
  Future<Either<NetworkFailure, List<MessageValue>>> getLanguageMessageValues(
      UniqueId languageId) {}

  @override
  Future<Either<NetworkFailure, List<Message>>> getProjectMessages(
      UniqueId projectId) async {
    final result = _projectMessages[projectId] ?? <Message>[];
    return right(result);
  }

  @override
  Future<Either<NetworkFailure, Unit>> saveMessageValue(
      UniqueId languageId, MessageValue messageValue) {}

  @override
  Future<Either<NetworkFailure, Unit>> saveProjectMessage(Message message) async {
    final _currentMessages = _projectMessages[message.projectId];
    if (_currentMessages != null) {
      final updatedMessages = List.from(_currentMessages)..add(message);
      _projectMessages[message.projectId] = updatedMessages;
    } else {
      _projectMessages[message.projectId] = List.from([message]);
    }
    return right(unit);
  }
}

final _projectMessages = <UniqueId, List<Message>>{
  UniqueId.fromString('1'): [
    Message.withEmptyDescription('app_name', UniqueId.fromString('1')),
    Message.withEmptyDescription('username', UniqueId.fromString('1')),
    Message.withEmptyDescription('create_account', UniqueId.fromString('1')),
    Message.withEmptyDescription('first_name', UniqueId.fromString('1')),
    Message.withEmptyDescription('last_name', UniqueId.fromString('1')),
  ],
  UniqueId.fromString('2'): [
    Message.withEmptyDescription('app_name', UniqueId.fromString('2')),
    Message.withEmptyDescription('requests', UniqueId.fromString('2')),
    Message.withEmptyDescription('sign_in', UniqueId.fromString('2')),
    Message.withEmptyDescription('sign_out', UniqueId.fromString('2')),
  ],
};
