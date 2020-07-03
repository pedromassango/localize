/*
 * Copyright 2020 Pedro Massango. All rights reserved.
 * Created by Pedro Massango on 3/7/2020.
 */

import 'package:app/src/domain/core/failures.dart';
import 'package:app/src/domain/core/project.dart';
import 'package:app/src/domain/core/services/project_service.dart';
import 'package:app/src/domain/core/value_objects/unique_id.dart';
import 'package:dartz/dartz.dart';


abstract class ProjectRepository {
  final ProjectService projectService;

  ProjectRepository(this.projectService) : assert (projectService != null);

  Future<Either<NetworkFailure, List<Project>>> getUserProjects(UniqueId userId);
}