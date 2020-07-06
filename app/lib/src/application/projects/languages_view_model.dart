/*
 * Copyright 2020 Pedro Massango. All rights reserved.
 * Created by Pedro Massango on 6/7/2020.
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
  }) = _LanguagesState;
}

class LanguagesViewModel extends Cubit<LanguagesState> {

  LanguagesViewModel({@required this.languageRepository}) :
        assert(languageRepository != null),
        super(LanguagesState());

  final LanguageRepository languageRepository;

  void saveLanguage(Project project, Language language) {
    final languages = List.of(state.languages, growable: true);
    languages.add(language);
    emit(state.copyWith.call(languages: languages));
    languageRepository.saveLanguage(project.id, language);
  }

  Future loadProjectLanguages(Project project) async {
    emit(state.copyWith.call(
      isLoadingLanguages: true,
      loadLanguageFailure: null
    ));

    final result = await languageRepository.getProjectLanguages(project.id);

    final newState = state.copyWith.call(
      isLoadingLanguages: false
    );

    result.fold(
          (l) => newState.copyWith.call(loadLanguageFailure: l, isLoadingLanguages: false),
          (r) => newState.copyWith.call(languages: r),
    );
    emit(newState);
  }
}
