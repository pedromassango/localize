/*
 * Copyright 2020 Pedro Massango. All rights reserved.
 * Created by Pedro Massango on 10/7/2020.
 */

import 'package:flutter/material.dart';
import 'package:build_context/build_context.dart';

/// A widget ta show a error text with a "try again" button bellow the text.
/// Used to inform the user that some operation went wrong.
class ErrorViewWidget extends StatelessWidget {
  final String message;
  final VoidCallback onTryAgain;

  const ErrorViewWidget(this.message, {this.onTryAgain}) : assert(message != null);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(message),
        ),
        if (onTryAgain != null)
          RaisedButton(
            color: context.primaryColor,
            child: Text(
              'Try again',
              style: context.textTheme.caption.copyWith(color: Colors.white),
            ),
            onPressed: onTryAgain,
          ),
      ],
    );
  }
}
