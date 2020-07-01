/*
 * Copyright 2020 Pedro Massango. All rights reserved.
 * Created by Pedro Massango on 2/7/2020.
 */

import 'package:app/src/application/projects/projects_view_model.dart';
import 'package:app/src/presentation/home/widgets/project_content_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:build_context/build_context.dart';
import 'widgets/side_bar.dart';

class HomePage extends StatelessWidget {
  static String route = '/home';

  final projectsViewModel = Modular.get<ProjectsViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SideBar(),
          Expanded(
            child: Observer(
              builder: (context) {
                if (projectsViewModel.selectedProject != null) {
                  return ProjectContentView(project: projectsViewModel.selectedProject);
                }
                return _NoSelectedProjectWidget();
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _NoSelectedProjectWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Icon(Icons.device_unknown, size: 90, color: context.primaryColor),
          ),
          Text(
            'No Project Selected.\nPlease select or create one.',
            textAlign: TextAlign.center,
            style: context.textTheme.headline6.copyWith(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
