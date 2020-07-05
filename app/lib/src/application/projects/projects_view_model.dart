/*
 * Copyright 2020 Pedro Massango. All rights reserved.
 * Created by Pedro Massango on 5/7/2020.
 */

import 'package:app/src/domain/core/failures.dart';
import 'package:app/src/domain/core/project.dart';
import 'package:app/src/domain/core/repositories/project_repository.dart';
import 'package:app/src/domain/core/value_objects/unique_id.dart';
import 'package:cubit/cubit.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobx/mobx.dart';

part 'projects_view_model.freezed.dart';

@freezed
abstract class ProjectsState with _$ProjectsState {
  factory ProjectsState({
    @Default([]) List<Project> projects,
    Project selectedProject,
    NetworkFailure loadProjectsFailure,
    @Default(false) bool isLoadingProjects,
  }) = _ProjectsState;
}

extension Ext on ProjectsState {
  bool get hasLoadingProjectsFailure => loadProjectsFailure != null;

  bool isSelectedProject(Project project) {
    assert(project != null);
    if (selectedProject == null) {
      return false;
    }
    return selectedProject.id.getOrThrow() == project.id.getOrThrow();
  }
}

class ProjectsViewModel extends Cubit<ProjectsState> {

  ProjectsViewModel(this._projectRepository) :
        assert(_projectRepository != null),
        super(ProjectsState());

  final ProjectRepository _projectRepository;

  @action
  void saveProject(String name) {
    final project = Project(
      id: UniqueId.generate(),
      name: name
    );

    emit(state.copyWith.call(projects: state.projects..add(project)));
  }

  @action
  void selectProject(Project project) {
    assert(project != null);

    emit(state.copyWith.call(selectedProject: project));
  }

  bool isSelectedProject(Project project) {
    assert(project != null);
    if (state.selectedProject == null) {
      return false;
    }
    return state.selectedProject.id.getOrThrow() == project.id.getOrThrow();
  }

  @action
  Future loadUserProjects(UniqueId userId) async {
    emit(state.copyWith.call(isLoadingProjects: true, loadProjectsFailure: null));

    final result = await _projectRepository.getUserProjects(userId);

    var newState = state.copyWith.call(isLoadingProjects: false);

    final r = newState = result.fold(
      (l) => newState.copyWith.call(loadProjectsFailure: l),
      (r) => newState.copyWith.call(projects: r, selectedProject: r.first),
    );
    emit(r.copyWith.call(isLoadingProjects: false));
    print('State updated');
  }
}
