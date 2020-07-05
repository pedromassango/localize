/*
 * Copyright 2020 Pedro Massango. All rights reserved.
 * Created by Pedro Massango on 5/7/2020.
 */

import 'package:app/src/application/auth/auth_state_view_model.dart';
import 'package:app/src/presentation/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:build_context/build_context.dart';
import 'package:flutter_cubit/flutter_cubit.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthPage extends StatefulWidget {
  static String route = '/auth';

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.primaryColor,
      body: CubitConsumer<AuthStateViewModel, AuthState>(
        listenWhen: (prev, newState) => newState.isLoggedIn,
        listener: (context, state) => Modular.to.pushNamed(HomePage.route),
        builder: (context, state) {
          final authViewModel = context.cubit<AuthStateViewModel>();

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 32),
                  child: Text('Please Login to get started'),
                ),
              ),
              /*Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 32, bottom: 16),
                  child: _GoogleSignInButton(
                    onPressed: () => authState.loginWithGoogle(),
                  ),
                ),
              ),*/
              Container(
                width: 200,
                height: 40,
                child: FlatButton.icon(
                  color: context.buttonColor,
                  icon: Icon(
                    Icons.security,
                    color: context.primaryColor,
                  ),
                  label: Text('Sign in Anonymously'),
                  onPressed: () => authViewModel.signInAnonymously(),
                ),
              )
            ],
          );
        }
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
              child: Icon(Icons.alternate_email),
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
