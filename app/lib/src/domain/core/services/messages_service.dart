/*
 * Copyright 2020 Pedro Massango. All rights reserved.
 * Created by Pedro Massango on 10/7/2020.
 */

import 'package:app/src/domain/core/failures.dart';
import 'package:app/src/domain/core/message.dart';
import 'package:app/src/domain/core/message_value.dart';
import 'package:app/src/domain/core/value_objects/unique_id.dart';
import 'package:dartz/dartz.dart';

abstract class MessagesService {

  Future<Either<NetworkFailure, List<Message>>> getProjectMessages(UniqueId projectId);

  Future<Either<NetworkFailure, Unit>> saveProjectMessage(Message message);

  Future<Either<NetworkFailure, List<MessageValue>>> getLanguageMessageValues(UniqueId languageId);

  Future<Either<NetworkFailure, Unit>> saveMessageValue(UniqueId languageId, MessageValue messageValue);
}