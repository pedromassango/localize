/*
 * Copyright 2020 Pedro Massango. All rights reserved.
 * Created by Pedro Massango on 3/7/2020.
 */

import 'package:app/src/domain/core/failures.dart';
import 'package:app/src/domain/core/project.dart';
import 'package:app/src/domain/core/repositories/project_repository.dart';
import 'package:app/src/domain/core/value_objects/unique_id.dart';
import 'package:mobx/mobx.dart';

part 'projects_view_model.g.dart';

class ProjectsViewModel = _ProjectsViewModelBase with _$ProjectsViewModel;

abstract class _ProjectsViewModelBase with Store {

  _ProjectsViewModelBase(this._projectRepository) {
    //selectProject(_fakeProjects.first);
  }

  final ProjectRepository _projectRepository;

  ObservableList<Project> projects = ObservableList.of([]);

  @observable
  Project selectedProject;

  @observable
  NetworkFailure loadProjectsFailure;
  final NetworkFailure _defaultProjectsError = null;

  @computed
  bool get hasLoadingProjectsFailure => loadProjectsFailure != _defaultProjectsError;

  @observable
  bool isLoadingProjects = false;

  @action
  void saveProject(String name) {
    final project = Project(
      id: UniqueId.generate(),
      name: name
    );

    projects.add(project);
  }

  @action
  void selectProject(Project project) {
    assert(project != null);

    if (projects.contains(project)) {
      selectedProject = project;
    }
  }

  bool isSelectedProject(Project project) {
    assert(project != null);
    if (selectedProject == null) {
      return false;
    }
    return selectedProject.id.getOrThrow() == project.id.getOrThrow();
  }

  @action
  Future loadUserProjects(UniqueId userId) async {
    loadProjectsFailure = _defaultProjectsError;
    isLoadingProjects = true;

    final result = await _projectRepository.getUserProjects(userId);
    isLoadingProjects = false;
    result.fold(
      (l) => loadProjectsFailure = l,
      (r) {
        projects.clear();
        projects.addAll(r);
      },
    );
  }
}
