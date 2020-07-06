/*
 * Copyright 2020 Pedro Massango. All rights reserved.
 * Created by Pedro Massango on 6/7/2020.
 */

import 'package:app/src/domain/core/failures.dart';
import 'package:app/src/domain/core/language.dart';
import 'package:app/src/domain/core/services/language_service.dart';
import 'package:app/src/domain/core/value_objects/unique_id.dart';
import 'package:dartz/dartz.dart';

class DefaultLanguageService extends LanguageService {
  @override
  Future<Either<NetworkFailure, List<Language>>> loadProjectLanguages(UniqueId projectId) async {
    return right(_localSource[projectId]);
  }

  @override
  Future<Either<NetworkFailure, Unit>> saveLanguage(UniqueId projectId, Language language) async {
    final languages = List.of([], growable: true);
    languages.addAll(_localSource[projectId]);
    languages.add(language);
    _localSource[projectId] = languages;
    return right(unit);
  }

}

final _localSource = <UniqueId, List<Language>> {
  UniqueId.fromString('1'): List.of([Language(code: 'pt', name: 'Portuguese'), Language(code: 'en', name: 'English')])
};