/*
 * Copyright 2020 Pedro Massango. All rights reserved.
 * Created by Pedro Massango on 10/7/2020.
 */

import 'package:app/src/domain/core/failures.dart';
import 'package:app/src/domain/core/language.dart';
import 'package:app/src/domain/core/repositories/language_repository.dart';
import 'package:app/src/domain/core/services/language_service.dart';
import 'package:app/src/domain/core/value_objects/unique_id.dart';
import 'package:dartz/dartz.dart';

class DefaultLanguageRepository extends LanguageRepository {
  DefaultLanguageRepository(LanguageService languageService) : super(languageService);

  @override
  Future<Either<NetworkFailure, List<Language>>> getProjectLanguages(UniqueId projectId) {
    return languageService.loadProjectLanguages(projectId);
  }

  @override
  Future<Either<NetworkFailure, Unit>> saveLanguage(UniqueId projectId, Language language) {
    return languageService.saveLanguage(projectId, language);
  }

}