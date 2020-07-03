/*
 * Copyright 2020 Pedro Massango. All rights reserved.
 * Created by Pedro Massango on 3/7/2020.
 */

import 'package:app/src/domain/core/failures.dart';
import 'package:app/src/domain/core/project.dart';
import 'package:app/src/domain/core/repositories/project_repository.dart';
import 'package:app/src/domain/core/services/project_service.dart';
import 'package:app/src/domain/core/value_objects/unique_id.dart';
import 'package:dartz/dartz.dart';

class DefaultProjectRepository extends ProjectRepository {
  DefaultProjectRepository(ProjectService projectService) : super(projectService);

  @override
  Future<Either<NetworkFailure, List<Project>>> getUserProjects(UniqueId userId) {
    return projectService.getUserProjects(userId);
  }

}