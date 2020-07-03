/*
 * Copyright 2020 Pedro Massango. All rights reserved.
 * Created by Pedro Massango on 3/7/2020.
 */

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'projects_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProjectsViewModel on _ProjectsViewModelBase, Store {
  Computed<bool> _$hasLoadingProjectsFailureComputed;

  @override
  bool get hasLoadingProjectsFailure => (_$hasLoadingProjectsFailureComputed ??=
          Computed<bool>(() => super.hasLoadingProjectsFailure,
              name: '_ProjectsViewModelBase.hasLoadingProjectsFailure'))
      .value;

  final _$selectedProjectAtom =
      Atom(name: '_ProjectsViewModelBase.selectedProject');

  @override
  Project get selectedProject {
    _$selectedProjectAtom.reportRead();
    return super.selectedProject;
  }

  @override
  set selectedProject(Project value) {
    _$selectedProjectAtom.reportWrite(value, super.selectedProject, () {
      super.selectedProject = value;
    });
  }

  final _$loadProjectsFailureAtom =
      Atom(name: '_ProjectsViewModelBase.loadProjectsFailure');

  @override
  NetworkFailure get loadProjectsFailure {
    _$loadProjectsFailureAtom.reportRead();
    return super.loadProjectsFailure;
  }

  @override
  set loadProjectsFailure(NetworkFailure value) {
    _$loadProjectsFailureAtom.reportWrite(value, super.loadProjectsFailure, () {
      super.loadProjectsFailure = value;
    });
  }

  final _$isLoadingProjectsAtom =
      Atom(name: '_ProjectsViewModelBase.isLoadingProjects');

  @override
  bool get isLoadingProjects {
    _$isLoadingProjectsAtom.reportRead();
    return super.isLoadingProjects;
  }

  @override
  set isLoadingProjects(bool value) {
    _$isLoadingProjectsAtom.reportWrite(value, super.isLoadingProjects, () {
      super.isLoadingProjects = value;
    });
  }

  final _$loadUserProjectsAsyncAction =
      AsyncAction('_ProjectsViewModelBase.loadUserProjects');

  @override
  Future<dynamic> loadUserProjects(UniqueId userId) {
    return _$loadUserProjectsAsyncAction
        .run(() => super.loadUserProjects(userId));
  }

  final _$_ProjectsViewModelBaseActionController =
      ActionController(name: '_ProjectsViewModelBase');

  @override
  void saveProject(String name) {
    final _$actionInfo = _$_ProjectsViewModelBaseActionController.startAction(
        name: '_ProjectsViewModelBase.saveProject');
    try {
      return super.saveProject(name);
    } finally {
      _$_ProjectsViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectProject(Project project) {
    final _$actionInfo = _$_ProjectsViewModelBaseActionController.startAction(
        name: '_ProjectsViewModelBase.selectProject');
    try {
      return super.selectProject(project);
    } finally {
      _$_ProjectsViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedProject: ${selectedProject},
loadProjectsFailure: ${loadProjectsFailure},
isLoadingProjects: ${isLoadingProjects},
hasLoadingProjectsFailure: ${hasLoadingProjectsFailure}
    ''';
  }
}
