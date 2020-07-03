/*
 * Copyright 2020 Pedro Massango. All rights reserved.
 * Created by Pedro Massango on 3/7/2020.
 */

import 'package:app/src/domain/core/failures.dart';
import 'package:app/src/domain/core/project.dart';
import 'package:app/src/domain/core/services/project_service.dart';
import 'package:app/src/domain/core/value_objects/unique_id.dart';
import 'package:dartz/dartz.dart';

class DefaultProjectService extends ProjectService {

  @override
  Future<Either<NetworkFailure, List<Project>>> getUserProjects(UniqueId userId) async {
    return right(_fakeProjects);
  }

}

final _fakeProjects = [
  Project(id: UniqueId.generate(), name: 'Localize'),
  Project(id: UniqueId.generate(), name: 'Facebook'),
  Project(id: UniqueId.generate(), name: 'Flutter Gallery'),
];