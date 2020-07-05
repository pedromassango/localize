/*
 * Copyright 2020 Pedro Massango. All rights reserved.
 * Created by Pedro Massango on 5/7/2020.
 */

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_overview_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProjectOverviewViewModel on _ProjectOverviewViewModelBase, Store {
  Computed<bool> _$hasLoadingProjectsFailureComputed;

  @override
  bool get hasLoadingProjectsFailure => (_$hasLoadingProjectsFailureComputed ??=
          Computed<bool>(() => super.hasLoadingProjectsFailure,
              name: '_ProjectOverviewViewModelBase.hasLoadingProjectsFailure'))
      .value;

  final _$loadLanguageFailureAtom =
      Atom(name: '_ProjectOverviewViewModelBase.loadLanguageFailure');

  @override
  NetworkFailure get loadLanguageFailure {
    _$loadLanguageFailureAtom.reportRead();
    return super.loadLanguageFailure;
  }

  @override
  set loadLanguageFailure(NetworkFailure value) {
    _$loadLanguageFailureAtom.reportWrite(value, super.loadLanguageFailure, () {
      super.loadLanguageFailure = value;
    });
  }

  final _$isLoadingLanguagesAtom =
      Atom(name: '_ProjectOverviewViewModelBase.isLoadingLanguages');

  @override
  bool get isLoadingLanguages {
    _$isLoadingLanguagesAtom.reportRead();
    return super.isLoadingLanguages;
  }

  @override
  set isLoadingLanguages(bool value) {
    _$isLoadingLanguagesAtom.reportWrite(value, super.isLoadingLanguages, () {
      super.isLoadingLanguages = value;
    });
  }

  final _$loadProjectLanguagesAsyncAction =
      AsyncAction('_ProjectOverviewViewModelBase.loadProjectLanguages');

  @override
  Future<dynamic> loadProjectLanguages(UniqueId projectId) {
    return _$loadProjectLanguagesAsyncAction
        .run(() => super.loadProjectLanguages(projectId));
  }

  final _$_ProjectOverviewViewModelBaseActionController =
      ActionController(name: '_ProjectOverviewViewModelBase');

  @override
  void saveLanguage(Project project, Language language) {
    final _$actionInfo = _$_ProjectOverviewViewModelBaseActionController
        .startAction(name: '_ProjectOverviewViewModelBase.saveLanguage');
    try {
      return super.saveLanguage(project, language);
    } finally {
      _$_ProjectOverviewViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loadLanguageFailure: ${loadLanguageFailure},
isLoadingLanguages: ${isLoadingLanguages},
hasLoadingProjectsFailure: ${hasLoadingProjectsFailure}
    ''';
  }
}
