/*
 * Copyright 2020 Pedro Massango. All rights reserved.
 * Created by Pedro Massango on 5/7/2020.
 */

import 'package:app/src/domain/core/failures.dart';
import 'package:app/src/domain/core/language.dart';
import 'package:app/src/domain/core/project.dart';
import 'package:app/src/domain/core/repositories/language_repository.dart';
import 'package:app/src/domain/core/value_objects/unique_id.dart';
import 'package:mobx/mobx.dart';

part 'project_overview_view_model.g.dart';

class ProjectOverviewViewModel = _ProjectOverviewViewModelBase with _$ProjectOverviewViewModel;

abstract class _ProjectOverviewViewModelBase with Store {

  _ProjectOverviewViewModelBase(this._languageRepository) : assert(_languageRepository != null);

  final LanguageRepository _languageRepository;

  ObservableList<Language> languages = ObservableList.of([]);

  @observable
  NetworkFailure loadLanguageFailure;
  final NetworkFailure _defaultLanguagesError = null;

  @computed
  bool get hasLoadingProjectsFailure => loadLanguageFailure != _defaultLanguagesError;

  @observable
  bool isLoadingLanguages = false;

  @action
  void saveLanguage(Project project, Language language) {
    languages.add(language);
    _languageRepository.saveLanguage(project.id, language);
  }

  @action
  Future loadProjectLanguages(UniqueId projectId) async {
    loadLanguageFailure = _defaultLanguagesError;
    isLoadingLanguages = true;

    final result = await _languageRepository.getProjectLanguages(projectId);
    isLoadingLanguages = false;
    result.fold(
          (l) => loadLanguageFailure = l,
          (r) {
        languages.clear();
        languages.addAll(r);
      },
    );
  }
}
