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
      UniqueId projectId) {}

  @override
  Future<Either<NetworkFailure, Unit>> saveMessageValue(
      UniqueId languageId, MessageValue messageValue) {}

  @override
  Future<Either<NetworkFailure, Unit>> saveProjectMessage(Message message) {}
}
