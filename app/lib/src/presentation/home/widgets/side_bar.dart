/*
 * Copyright 2020 Pedro Massango. All rights reserved.
 * Created by Pedro Massango on 3/7/2020.
 */

import 'package:app/src/application/auth/auth_state_view_model.dart';
import 'package:app/src/application/projects/projects_view_model.dart';
import 'package:app/src/domain/core/project.dart';
import 'package:app/src/presentation/add_project/new_project_dialog.dart';
import 'package:app/src/presentation/common/app_logo.dart';
import 'package:app/src/presentation/common/circular_network_image.dart';
import 'package:flutter/material.dart';
import 'package:build_context/build_context.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SideBar extends StatelessWidget {
  final projectsViewModel = Modular.get<ProjectsViewModel>();
  final authViewModel = Modular.get<AuthStateViewModel>();

  @override
  Widget build(BuildContext context) {
    final width = 200.0;

    return Container(
      width: width,
      height: context.mediaQuerySize.height,
      color: context.primaryColor,
      child: Column(
        children: [
          Logo(),
          Divider(color: Colors.black12),
          Observer(
            builder: (context) {
              if (projectsViewModel.isLoadingProjects) {
                return SizedBox(height: 1.5, child: LinearProgressIndicator());
              } else if (projectsViewModel.hasLoadingProjectsFailure) {
                return GestureDetector(
                  onTap: () => projectsViewModel.loadUserProjects(authViewModel.user.id),
                    child: Text(
                        'Failed to Load projects.\nTap to try again!',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.red),
                    ),
                );
              }
              return Expanded(
                child: ListView(
                  children: projectsViewModel.projects.map<Widget>((project) {
                    return _ProjectListItem(
                      project: project,
                      isSelected: projectsViewModel.isSelectedProject(project),
                      onPressed: () => projectsViewModel.selectProject(project),
                    );
                  }).toList()..add(AddNewProjectButton()),
                ),
              );
            },
          ),
          Spacer(),
          Divider(color: Colors.black12),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
            child: _AccountSection(),
          ),
        ],
      ),
    );
  }
}

class _ProjectListItem extends StatelessWidget {
  final Project project;
  final VoidCallback onPressed;
  final bool isSelected;

  const _ProjectListItem({
    @required this.project,
    @required this.onPressed,
    @required this.isSelected,
  }) : assert(project != null),
      assert(isSelected != null);

  @override
  Widget build(BuildContext context) {
    final iconAndTextColor = isSelected ? context.primaryColor : Colors.white;
    final backgroundColor = isSelected ? Colors.white : context.primaryColor;

    return SizedBox(
      height: 50,
      child: MaterialButton(
        elevation: 0.0,
        hoverElevation: 0.0,
        highlightElevation: 0,
        shape: RoundedRectangleBorder(),
        color: backgroundColor,
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
        onPressed: onPressed,
      ),
    );
  }
}

class _AccountSection extends StatelessWidget {
  final authState = Modular.get<AuthStateViewModel>();

  @override
  Widget build(BuildContext context) {

    print(authState.user.name);
    return Observer(
      builder: (context) {
        return Row(
          children: [
            CircularNetworkImage(authState.user.photoUrl),
            Text(authState.user.name,
              style: context.textTheme.subtitle2.copyWith(
                color: Colors.white,
              ),
            ),
          ],
        );
      },
    );
  }
}

