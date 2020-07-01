/*
 * Copyright 2020 Pedro Massango. All rights reserved.
 * Created by Pedro Massango on 1/7/2020.
 */

import 'package:app/src/application/auth/auth_state_view_model.dart';
import 'package:app/src/presentation/common/app_style.dart';
import 'package:app/src/presentation/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:build_context/build_context.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobx/mobx.dart';

class AuthPage extends StatefulWidget {
  static String route = '/auth';

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final disposers = <ReactionDisposer>[];
  final authState = Modular.get<AuthStateViewModel>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    disposers.add(when((_) => authState.isLoggedIn, () {
      Modular.to.pushNamed(HomePage.route);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: GestureDetector(
              onTap: () {
                authState.loginWithGoogle();
              },
                child: Text('Please Login to get started')),
          ),
          Center(
            child: _GoogleSignInButton(
              onPressed: () => authState.loginWithGoogle(),
            ),
          ),
          Center(
            child: Container(
              width: double.infinity,
              height: 56,
              child: FlatButton.icon(
                color: context.primaryColor,
                icon: Icon(
                  Icons.alternate_email,
                  color: Colors.white,
                ),
                label: Text('Sign in with Github'),
                onPressed: () => authState.loginWithGitHub(),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _GoogleSignInButton extends StatelessWidget {
  final VoidCallback onPressed;

  const _GoogleSignInButton({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: Size(200, 42),
      child: RaisedButton(
        onPressed: onPressed,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Icon(AppIcons.google),
            ),
            Text(
              'Sign in with Google',
              style: context.textTheme.headline6.copyWith(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
