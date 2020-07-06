/*
 * Copyright 2020 Pedro Massango. All rights reserved.
 * Created by Pedro Massango on 6/7/2020.
 */

import 'package:app/src/domain/core/failures.dart';
import 'package:app/src/domain/core/project.dart';
import 'package:app/src/domain/core/repositories/project_repository.dart';
import 'package:app/src/domain/core/value_objects/unique_id.dart';
import 'package:cubit/cubit.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'projects_view_model.freezed.dart';

@freezed
abstract class ProjectsState with _$ProjectsState {
  const factory ProjectsState({
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

  void saveProject(String name) {
    final project = Project(
      id: UniqueId.generate(),
      name: name
    );

    final projects = List.of(state.projects, growable: true);
    projects.add(project);

    emit(state.copyWith.call(projects: projects));
  }

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

  void loadUserProjects(UniqueId userId) async {
    emit(state.copyWith(isLoadingProjects: true, loadProjectsFailure: null));

    final result = await _projectRepository.getUserProjects(userId);

    final newState = result.fold(
      (l) => state.copyWith(loadProjectsFailure: l, isLoadingProjects: false),
      (r) => state.copyWith(projects: r, selectedProject: r.first, isLoadingProjects: false),
    );

    print('New state (before emit()): ${state.isLoadingProjects}');
    emit(newState);
    print('New state (after emit()): ${state.isLoadingProjects}');

  }
}
