/*
 * Copyright 2020 Pedro Massango. All rights reserved.
 * Created by Pedro Massango on 1/7/2020.
 */

import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
abstract class AuthFailure with _$AuthFailure {
  const factory AuthFailure.networkError() = NetworkError;
  const factory AuthFailure.authCanceled() = _AuthCanceled;
}

@freezed
abstract class UserFailure with _$UserFailure {
  const factory UserFailure.userNotFound() = _UserNotFound;
}