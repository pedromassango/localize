/*
 * Copyright 2020 Pedro Massango. All rights reserved.
 * Created by Pedro Massango on 3/7/2020.
 */

import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

abstract class Failure {}

@freezed
abstract class AuthFailure extends Failure with _$AuthFailure {
  const factory AuthFailure.networkError() = NetworkError;
  const factory AuthFailure.authCanceled() = _AuthCanceled;
}

@freezed
abstract class UserFailure extends Failure with _$UserFailure {
  const factory UserFailure.userNotFound() = _UserNotFound;
}

@freezed
abstract class NetworkFailure extends Failure with _$NetworkFailure {
  const factory NetworkFailure.networkError() = _NetworkError;
}