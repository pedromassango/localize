/*
 * Copyright 2020 Pedro Massango. All rights reserved.
 * Created by Pedro Massango on 2/7/2020.
 */

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'projects_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProjectsViewModel on _ProjectsViewModelBase, Store {
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
selectedProject: ${selectedProject}
    ''';
  }
}
