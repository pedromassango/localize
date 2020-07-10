/*
 * Copyright 2020 Pedro Massango. All rights reserved.
 * Created by Pedro Massango on 10/7/2020.
 */

import 'package:app/src/domain/core/failures.dart';
import 'package:app/src/domain/core/language.dart';
import 'package:app/src/domain/core/project.dart';
import 'package:app/src/domain/core/repositories/language_repository.dart';
import 'package:cubit/cubit.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'languages_view_model.freezed.dart';

@freezed
abstract class LanguagesState with _$LanguagesState {
  factory LanguagesState({
    @Default(false) bool isLoadingLanguages,
    NetworkFailure loadLanguageFailure,
    @Default([]) List<Language> languages,
    Project project,
  }) = _LanguagesState;
}

class LanguagesViewModel extends Cubit<LanguagesState> {

  LanguagesViewModel({@required this.languageRepository}) :
        assert(languageRepository != null),
        super(LanguagesState());

  final LanguageRepository languageRepository;

  // This need to be called before using any other method inside of this class.
  Future onSelectedProjectChanged(Project selectedProject) async {
    emit(state.copyWith(project: selectedProject, languages: []));
    await loadProjectLanguages();
  }

  void saveLanguage(Language language) {
    ArgumentError.checkNotNull(state.project != null);

    final languages = List.of(state.languages, growable: true);
    languages.add(language);
    emit(state.copyWith.call(languages: languages));
    languageRepository.saveLanguage(state.project.id, language);
  }

  Future loadProjectLanguages() async {
    ArgumentError.checkNotNull(state.project != null);

    emit(state.copyWith.call(
      isLoadingLanguages: true,
      loadLanguageFailure: null
    ));

    final result = await languageRepository.getProjectLanguages(state.project.id);

    var newState = state.copyWith.call(isLoadingLanguages: false);

    newState = result.fold(
          (l) => newState.copyWith(loadLanguageFailure: l),
          (r) => newState.copyWith(languages: r),
    );
    emit(newState);
  }
}
