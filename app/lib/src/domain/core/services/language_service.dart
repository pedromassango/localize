/*
 * Copyright 2020 Pedro Massango. All rights reserved.
 * Created by Pedro Massango on 5/7/2020.
 */

import 'package:app/src/domain/core/failures.dart';
import 'package:app/src/domain/core/language.dart';
import 'package:app/src/domain/core/value_objects/unique_id.dart';
import 'package:dartz/dartz.dart';

abstract class LanguageService {

  Future<Either<NetworkFailure, Unit>> saveLanguage(UniqueId projectId, Language language);

  Future<Either<NetworkFailure, List<Language>>> loadProjectLanguages(UniqueId projectId);
}