/*
 * Copyright 2020 Pedro Massango. All rights reserved.
 * Created by Pedro Massango on 1/7/2020.
 */

import 'package:flutter/material.dart';

import 'widgets/side_bar.dart';

class HomePage extends StatelessWidget {
  static String route = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SideBar(),
        ],
      ),
    );
  }
}
