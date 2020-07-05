
/*
 * Copyright 2020 Pedro Massango. All rights reserved.
 * Created by Pedro Massango on 5/7/2020.
 */

import 'package:app/src/application/projects/project_overview/project_overview_view_model.dart';
import 'package:app/src/application/projects/projects_view_model.dart';
import 'package:app/src/domain/core/repositories/language_repository.dart';
import 'package:app/src/domain/core/repositories/project_repository.dart';
import 'package:app/src/domain/core/services/language_service.dart';
import 'package:app/src/infrastructure/projects/default_language_repository.dart';
import 'package:app/src/infrastructure/projects/default_language_service.dart';
import 'package:app/src/presentation/home/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends ChildModule {

  @override
  List<Bind> get binds => [
    Bind<ProjectsViewModel>((i) => ProjectsViewModel(i.get<ProjectRepository>())),
    Bind<LanguageService>((i) => DefaultLanguageService()),
    Bind<LanguageRepository>((i) => DefaultLanguageRepository(i.get<LanguageService>())),
    Bind<ProjectOverviewViewModel>((i) => ProjectOverviewViewModel(i.get<LanguageRepository>())),
  ];

  @override
  List<Router> get routers => [
    Router('/home', child: (context, args) => HomePage()),
  ];
}