/*
 * Copyright 2020 Pedro Massango. All rights reserved.
 * Created by Pedro Massango on 6/7/2020.
 */

import 'package:app/src/application/auth/auth_state_view_model.dart';
import 'package:app/src/application/projects/languages_view_model.dart';
import 'package:app/src/application/projects/projects_view_model.dart';
import 'package:app/src/domain/core/repositories/project_repository.dart';
import 'package:app/src/presentation/home/widgets/project_content_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cubit/flutter_cubit.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:build_context/build_context.dart';
import 'widgets/side_bar.dart';

class HomePage extends StatefulWidget {
  static String route = '/home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    context.cubit<ProjectsViewModel>().loadUserProjects(context.cubit<AuthStateViewModel>().state.user.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SideBar(),
          Expanded(
            child: CubitConsumer<ProjectsViewModel, ProjectsState>(
              buildWhen: (prevState, newState) => prevState.selectedProject != newState.selectedProject,
              listenWhen: (prevState, newState) => prevState.selectedProject != newState.selectedProject,
              // This makes sure the languages viewModel that depends on the
              // selected Project gets rebuilt every time the selected project
              // changes.
              listener: (context, state) => context.cubit<LanguagesViewModel>().onSelectedProjectChanged(state.selectedProject),
              builder: (context, state) {
                if (state.selectedProject != null) {
                  return ProjectContentView(project: state.selectedProject);
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
            child: Icon(
                Icons.device_unknown, size: 90, color: context.primaryColor),
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
