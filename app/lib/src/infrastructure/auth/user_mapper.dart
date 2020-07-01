/*
 * Copyright 2020 Pedro Massango. All rights reserved.
 * Created by Pedro Massango on 1/7/2020.
 */

 import 'package:app/src/domain/core/user.dart';
import 'package:app/src/domain/core/value_objects/unique_id.dart';
import 'package:firebase_auth/firebase_auth.dart';

 User firebaseUserToUser(FirebaseUser user) {
   return User(
     id: UniqueId.fromString(user.uid),
     name: user.displayName,
     email: user.email,
     photoUrl: user.photoUrl,
     isAnonymous: user.isAnonymous,
     isAccountVerified: user.isEmailVerified,
   );
 }