/*
 * Copyright 2020 Pedro Massango. All rights reserved.
 * Created by Pedro Massango on 2/7/2020.
 */

import 'package:app/src/domain/core/project.dart';
import 'package:app/src/domain/core/value_objects/unique_id.dart';
import 'package:mobx/mobx.dart';

part 'projects_view_model.g.dart';

class ProjectsViewModel = _ProjectsViewModelBase with _$ProjectsViewModel;

abstract class _ProjectsViewModelBase with Store {

  ObservableList<Project> projects = ObservableList.of(_fakeProjects);

  @observable
  Project selectedProject;

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
}

final _fakeProjects = [
  Project(id: UniqueId.generate(), name: 'Localize'),
  Project(id: UniqueId.generate(), name: 'Facebook'),
  Project(id: UniqueId.generate(), name: 'Flutter Gallery'),
];