
/*
 * Copyright 2020 Pedro Massango. All rights reserved.
 * Created by Pedro Massango on 3/7/2020.
 */

import 'package:app/src/application/projects/projects_view_model.dart';
import 'package:app/src/domain/core/repositories/project_repository.dart';
import 'package:app/src/presentation/home/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends ChildModule {

  @override
  List<Bind> get binds => [
    Bind<ProjectsViewModel>((i) => ProjectsViewModel(i.get<ProjectRepository>())),
  ];

  @override
  List<Router> get routers => [
    Router('/home', child: (context, args) => HomePage()),
  ];
}