/*
 * Copyright 2020 Pedro Massango. All rights reserved.
 * Created by Pedro Massango on 10/7/2020.
 */

import 'package:app/src/domain/core/repositories/language_repository.dart';
import 'package:app/src/domain/core/repositories/messages_repository.dart';
import 'package:app/src/domain/core/repositories/project_repository.dart';
import 'package:app/src/infrastructure/projects/language/default_language_repository.dart';
import 'package:app/src/infrastructure/projects/default_project_repository.dart';
import 'package:app/src/infrastructure/projects/default_project_service.dart';
import 'package:app/src/infrastructure/projects/language/default_language_service.dart';
import 'package:app/src/infrastructure/projects/messages/default_messages_repository.dart';
import 'package:app/src/infrastructure/projects/messages/default_messages_service.dart';
import 'package:app/src/presentation/auth/auth_page.dart';
import 'package:app/src/application/auth/auth_state_view_model.dart';
import 'package:app/src/presentation/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app.dart';

class AppModule extends MainModule {
  final AuthStateViewModel authStateViewModel;

  AppModule({
    @required this.authStateViewModel,
  });

  @override
  List<Bind> get binds => [
    Bind<ProjectRepository>((_) => DefaultProjectRepository(DefaultProjectService())),
    Bind<LanguageRepository>((_) => DefaultLanguageRepository(DefaultLanguageService())),
    Bind<MessagesRepository>((_) => DefaultMessagesRepository(DefaultMessagesService())),
  ];

  @override
  Widget get bootstrap => App(authStateViewModel: authStateViewModel);

  @override
  List<Router> get routers => [
    Router('/home', child: (_, __) => HomePage()),
    Router('/auth', child: (_, __) => AuthPage()),
  ];
}
