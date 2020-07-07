/*
 * Copyright 2020 Pedro Massango. All rights reserved.
 * Created by Pedro Massango on 7/7/2020.
 */

import 'package:app/src/domain/core/failures.dart';
import 'package:app/src/domain/core/language.dart';
import 'package:app/src/domain/core/services/language_service.dart';
import 'package:app/src/domain/core/value_objects/unique_id.dart';
import 'package:dartz/dartz.dart';

class DefaultLanguageService extends LanguageService {
  @override
  Future<Either<NetworkFailure, List<Language>>> loadProjectLanguages(UniqueId projectId) async {
    final result = _localSource[projectId]?.toList() ?? <Language>[];

    return right(result);
  }

  @override
  Future<Either<NetworkFailure, Unit>> saveLanguage(UniqueId projectId, Language language) async {
    final result = _localSource[projectId]?.toList();
    if (result != null) {
      final languages = List.of(result, growable: true);
      languages.add(language);
      _localSource[projectId] = languages;
    } else {
      final languages = List<Language>.of([], growable: true);
      languages.add(language);
      _localSource[projectId] = languages;
    }
    return right(unit);
  }

}

final _localSource = <UniqueId, List<Language>> {
  UniqueId.fromString('1'): List.of([Language(code: 'pt', name: 'Portuguese'), Language(code: 'en', name: 'English')])
};