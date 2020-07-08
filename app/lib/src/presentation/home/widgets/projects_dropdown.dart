/*
 * Copyright 2020 Pedro Massango. All rights reserved.
 * Created by Pedro Massango on 8/7/2020.
 */

import 'package:app/src/application/projects/projects_view_model.dart';
import 'package:app/src/domain/core/project.dart';
import 'package:app/src/presentation/home/add_project/new_project_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cubit/flutter_cubit.dart';
import 'package:build_context/build_context.dart';

class ProjectsDropdownButton extends StatefulWidget {
  final ProjectsState projectsState;

  const ProjectsDropdownButton({@required this.projectsState}) : assert(projectsState != null);

  @override
  _ProjectsDropdownButtonState createState() => _ProjectsDropdownButtonState();
}

class _ProjectsDropdownButtonState extends State<ProjectsDropdownButton> {

  final String _newProjectItemValue = '_new_project';

  ProjectsState get state => widget.projectsState;

  Object _selectedProject;

  void _onCreateNewProject() {
    showDialog(
        context: context,
        builder: (context) => NewProjectDialog()
    );
  }

  void _onItemSelected(Object value) {
    if (value is Project) {
      setState(() => _selectedProject = value);
      context.cubit<ProjectsViewModel>().selectProject(value);
    } else {
      _onCreateNewProject();
    }
  }

  @override
  Widget build(BuildContext context) {
    final iconAndTextColor = context.primaryColor;

    return Builder(
      builder: (context) {
        if (state.isLoadingProjects == null || state.isLoadingProjects) {
          return SizedBox(height: 1.5, child: LinearProgressIndicator());
        } else if (state.hasLoadingProjectsFailure) {
          return GestureDetector(
            child: Text(
              'Failed to Load projects.\nTap to try again!',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.red),
            ),
          );
        }
        return DropdownButton<Object>(
          value: _selectedProject,
          icon: Icon(Icons.arrow_drop_down, color: Colors.white54),
          hint: Center(
            child: Text('Select a Project',
              style: TextStyle(color: Colors.white54),
            ),
          ),
          underline: SizedBox.shrink(),
          selectedItemBuilder: (context) {
            return state.projects.map<Widget>((project) {
              return Center(child: Text(project.name, style: TextStyle(color: Colors.white)));
            }).toList();
          },
          items: state.projects.map((project) {
            return DropdownMenuItem<Object>(
              value: project,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Icon(Icons.stay_primary_portrait, color: iconAndTextColor),
                  ),
                  Text(project.name,
                    style: context.textTheme.bodyText2.copyWith(
                      color: iconAndTextColor,
                    ),
                  ),
                ],
              ),
            );
          }).toList()..add(DropdownMenuItem<String>(
            value: _newProjectItemValue,
            child: Text('Create Project'),
          )),
          onChanged: (project) => _onItemSelected(project),
        );
      },
    );
  }
}