/*
 * Copyright 2020 Pedro Massango. All rights reserved.
 * Created by Pedro Massango on 8/7/2020.
 */

import 'package:flutter/material.dart';

class CircularNetworkImage extends StatelessWidget {
  final String profileUrl;

  const CircularNetworkImage(this.profileUrl);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
          color: Colors.blueGrey,
          shape: BoxShape.circle,
          image: DecorationImage(
              image: NetworkImage(profileUrl)
          )
      ),
    );
  }
}