/*
 * Copyright 2020 Pedro Massango. All rights reserved.
 * Created by Pedro Massango on 8/7/2020.
 */

import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width:40,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Icon(Icons.language, size: 36, color: Colors.white),
      ),
    );
  }
}