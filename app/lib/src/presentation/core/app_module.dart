/*
 * Copyright 2020 Pedro Massango. All rights reserved.
 * Created by Pedro Massango on 3/7/2020.
 */

import 'package:app/src/domain/core/repositories/project_repository.dart';
import 'package:app/src/infrastructure/projects/default_project_repository.dart';
import 'package:app/src/infrastructure/projects/default_project_service.dart';
import 'package:app/src/presentation/auth/auth_page.dart';
import 'package:app/src/application/auth/auth_state_view_model.dart';
import 'package:app/src/presentation/home/home_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app.dart';

class AppModule extends MainModule {
  final AuthStateViewModel authStateViewModel;

  AppModule({this.authStateViewModel});

  @override
  List<Bind> get binds => [
    Bind<AuthStateViewModel>((i) => authStateViewModel),
    Bind<ProjectRepository>((_) => DefaultProjectRepository(DefaultProjectService())),
  ];

  @override
  Widget get bootstrap => App();

  @override
  List<Router> get routers => [
    Router('/home', module: HomeModule()),
    Router('/auth', child: (_, __) => AuthPage()),
  ];
}
