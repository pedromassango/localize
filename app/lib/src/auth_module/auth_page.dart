import 'dart:async';

import 'package:flutter/material.dart';
import 'package:build_context/build_context.dart';

class AuthPage extends StatefulWidget {
  static String route = '/auth';

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.primaryColor,
      body: Center(
        child: Text('Please Login to get started'),
      ),
    );
  }
}
