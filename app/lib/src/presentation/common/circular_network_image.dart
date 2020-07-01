/*
 * Copyright 2020 Pedro Massango. All rights reserved.
 * Created by Pedro Massango on 1/7/2020.
 */

import 'package:flutter/material.dart';

class CircularNetworkImage extends StatelessWidget {
  final String profileUrl;

  const CircularNetworkImage(this.profileUrl);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      margin: EdgeInsets.only(right: 16),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
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