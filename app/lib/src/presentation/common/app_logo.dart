/*
 * Copyright 2020 Pedro Massango. All rights reserved.
 * Created by Pedro Massango on 9/7/2020.
 */

import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Icon(Icons.language, size: 24, color: Colors.white),
      ),
    );
  }
}