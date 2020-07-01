/*
 * Copyright 2020 Pedro Massango. All rights reserved.
 * Created by Pedro Massango on 1/7/2020.
 */

import 'package:app/src/application/auth/auth_state_view_model.dart';
import 'package:app/src/presentation/common/app_logo.dart';
import 'package:app/src/presentation/common/circular_network_image.dart';
import 'package:flutter/material.dart';
import 'package:build_context/build_context.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SideBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = 200.0;

    return Container(
      width: width,
      height: context.mediaQuerySize.height,
      color: context.primaryColor,
      child: Column(
        children: [
          Logo(),
          Divider(color: Colors.black12),
          Expanded(
            child: ListView(
              children: [
                // TODO: projects goes here
                _AddNewProjectButton()
              ],
            ),
          ),
          Spacer(),
          Divider(color: Colors.black12),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
            child: _AccountSection(),
          ),
        ],
      ),
    );
  }
}

class _AddNewProjectButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: MaterialButton(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Icon(Icons.add, color: Colors.white54),
            ),
            Text('New Project', style: context.textTheme.bodyText2.copyWith(
              color: Colors.white54
            )),
          ],
        ),
        onPressed: () {
          //TODO: start screen to create a new project
        },
      ),
    );
  }
}

class _AccountSection extends StatelessWidget {
  final authState = Modular.get<AuthStateViewModel>();

  @override
  Widget build(BuildContext context) {

    print(authState.user.name);
    return Observer(
      builder: (context) {
        return Row(
          children: [
            CircularNetworkImage(authState.user.photoUrl),
            Text(authState.user.name,
              style: context.textTheme.subtitle2.copyWith(
                color: Colors.white,
              ),
            ),
          ],
        );
      },
    );
  }
}

