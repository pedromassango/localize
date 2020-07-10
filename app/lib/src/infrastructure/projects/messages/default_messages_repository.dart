/*
 * Copyright 2020 Pedro Massango. All rights reserved.
 * Created by Pedro Massango on 10/7/2020.
 */

import 'package:app/src/domain/core/failures.dart';
import 'package:app/src/domain/core/message.dart';
import 'package:app/src/domain/core/message_value.dart';
import 'package:app/src/domain/core/repositories/messages_repository.dart';
import 'package:app/src/domain/core/services/messages_service.dart';
import 'package:app/src/domain/core/value_objects/unique_id.dart';
import 'package:dartz/dartz.dart';

class DefaultMessagesRepository extends MessagesRepository {

  DefaultMessagesRepository(MessagesService messagesService) : super(messagesService);

  @override
  Future<Either<NetworkFailure, List<MessageValue>>> getLanguageMessageValues(UniqueId languageId) {
    return messagesService.getLanguageMessageValues(languageId);
  }

  @override
  Future<Either<NetworkFailure, List<Message>>> getProjectMessages(UniqueId projectId) {
    return messagesService.getProjectMessages(projectId);
  }

  @override
  Future<Either<NetworkFailure, Unit>> saveMessageValue(UniqueId languageId, MessageValue messageValue) {
    return messagesService.saveMessageValue(languageId, messageValue);
  }

  @override
  Future<Either<NetworkFailure, Unit>> saveProjectMessage(Message message) {
    return messagesService.saveProjectMessage(message);
  }

}