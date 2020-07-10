/*
 * Copyright 2020 Pedro Massango. All rights reserved.
 * Created by Pedro Massango on 7/7/2020.
 */

import 'package:app/src/application/auth/auth_state_view_model.dart';
import 'package:app/src/application/projects/languages_view_model.dart';
import 'package:app/src/application/projects/messages_view_model.dart';
import 'package:app/src/application/projects/projects_view_model.dart';
import 'package:app/src/domain/core/value_objects/unique_id.dart';
import 'package:app/src/presentation/common/app_logo.dart';
import 'package:app/src/presentation/common/circular_network_image.dart';
import 'package:app/src/presentation/home/widgets/project_content_view.dart';
import 'package:app/src/presentation/home/widgets/projects_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cubit/flutter_cubit.dart';
import 'package:build_context/build_context.dart';

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
      appBar: TopAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppStyle.pageContentPadding, vertical: 32),
        child: CubitConsumer<ProjectsViewModel, ProjectsState>(
          buildWhen: (prevState, newState) => prevState.selectedProject != newState.selectedProject,
          listenWhen: (prevState, newState) => prevState.selectedProject != newState.selectedProject,
          // This makes sure the languages viewModel that depends on the
          // selected Project gets rebuilt every time the selected project
          // changes.
          listener: (context, state) {
            context.cubit<LanguagesViewModel>().onSelectedProjectChanged(state.selectedProject);
            context.cubit<MessagesViewModel>().onSelectedProjectChanged(state.selectedProject);
          },
          builder: (context, state) {
            if (state.selectedProject != null) {
              return ProjectContentView(project: state.selectedProject);
            }
            return _NoSelectedProjectWidget();
          },
        ),
      ),
    );
  }
}

class TopAppBar extends PreferredSize {

  @override
  Size get preferredSize => Size(double.infinity, 50);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.primaryColor,
      padding: const EdgeInsets.symmetric(horizontal: AppStyle.pageContentPadding),
      child: Row(
        children: [
          AppLogo(),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: CubitBuilder<ProjectsViewModel, ProjectsState>(
              buildWhen: (prev, newState) => prev.projects.length != newState.projects.length,
              builder: (context, state) => ProjectsDropdownButton(projectsState: state),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: CubitBuilder<AuthStateViewModel, AuthState>(
              builder: (context, authState) {
                if (!authState.isLoggedIn) {
                  return SizedBox.shrink();
                }
                return _AccountSection(authState: authState);
              },
            ),
          )
        ],
      ),
    );
  }
}

class _AccountSection extends StatelessWidget {
  final AuthState authState;

  const _AccountSection({this.authState}) : assert(authState != null);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: Text(
            authState.user.name,
            style: context.textTheme.subtitle2.copyWith(
              color: Colors.white,
            ),
          ),
        ),
        CircularNetworkImage(authState.user.photoUrl),
      ],
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
