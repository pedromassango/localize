/*
 * Copyright 2020 Pedro Massango. All rights reserved.
 * Created by Pedro Massango on 1/7/2020.
 */

import 'package:app/src/domain/core/entity.dart';
import 'package:app/src/domain/core/value_objects/unique_id.dart';
import 'package:flutter/foundation.dart';

class User extends Entity {

  @override
  final UniqueId id;
  final String name;
  final String photoUrl;
  final String email;
  final bool isAccountVerified;
  final bool isAnonymous;

  User({
    @required this.id,
    @required this.name,
    @required this.email,
    @required this.photoUrl,
    @required this.isAnonymous,
    @required this.isAccountVerified,
  });

  factory User.anonymous(UniqueId id) {
    return User(
      id: id,
      name: 'Anonymous',
      email: '',
      isAccountVerified: false,
      isAnonymous: true,
      photoUrl: 'https://clikiads.com/static/images/blank_profile.png'
    );
  }
}
