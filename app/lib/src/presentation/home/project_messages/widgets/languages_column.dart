/*
 * Copyright 2020 Pedro Massango. All rights reserved.
 * Created by Pedro Massango on 7/7/2020.
 */

import 'package:app/src/domain/core/language.dart';
import 'package:flutter/material.dart';
import 'package:build_context/build_context.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'column_header.dart';

class LanguageColumn extends StatelessWidget {
  final Language language;

  const LanguageColumn({this.language});

  @override
  Widget build(BuildContext context) {
    final borderSide = BorderSide(color: Colors.grey);

    return Container(
      width: 390,
      decoration: BoxDecoration(
          border: Border(
            top: BorderSide(),
            bottom: borderSide,
            right: borderSide,
          )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LinearPercentIndicator(
            percent: .55,
            lineHeight: ColumnHeader.height,
            padding: EdgeInsets.zero,
            progressColor: context.primaryColor,
            linearStrokeCap: LinearStrokeCap.butt,
            center: Text(language.name,
              style: context.textTheme.headline6.copyWith(
                  fontSize: 16,
                  color: Colors.white
              ),
            ),
          ),
        ],
      ),
    );
  }
}
