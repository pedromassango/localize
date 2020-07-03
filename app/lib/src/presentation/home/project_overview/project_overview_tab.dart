/*
 * Copyright 2020 Pedro Massango. All rights reserved.
 * Created by Pedro Massango on 3/7/2020.
 */

import 'package:app/src/application/projects/projects_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:build_context/build_context.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ProjectOverViewTab extends StatelessWidget {
  final projectsViewModel = Modular.get<ProjectsViewModel>();

  @override
  Widget build(BuildContext context) {
    final languagesWidgets = List<Widget>();
    languagesWidgets.add(_AddLanguageCard());
    languagesWidgets.add(_LanguageInfoListItem());

    return Padding(
      padding: const EdgeInsets.only(left: 24, top: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 200,
            child: Observer(
              builder: (context) {
                return TextFormField(
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: 'Project Name',
                    border: OutlineInputBorder()
                  ),
                  initialValue: projectsViewModel.selectedProject.name,
                );
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 32, bottom: 16),
            child: Text('Supported Languages',
              style: context.textTheme.headline5,
            ),
          ),
          SizedBox.fromSize(
            size: Size(context.mediaQuerySize.width, 270),
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.all(8),
              semanticChildCount: languagesWidgets.length,
              children: languagesWidgets,
            ),
          )
        ],
      ),
    );
  }
}

class _LanguageInfoListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final itemSize = Size(200, 260);
    return Container(
      width: itemSize.width,
      height: itemSize.height,
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8
          )
        ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: CircularPercentIndicator(
              percent: 0.6,
              lineWidth: 8,
              center: Text('37%'),
              radius: itemSize.width * .4,
              circularStrokeCap: CircularStrokeCap.round,
              progressColor: context.primaryColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Text('English - US'),
          ),
          Text('20 strings', style: context.textTheme.caption)
        ],
      ),
    );
  }
}

class _AddLanguageCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final itemSize = Size(200, 260);
    return Container(
      width: itemSize.width,
      height: itemSize.height,
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8
          )
        ]
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add_circle_outline,
              size: 80,
              color: Colors.black12,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text('Add Language',
                style: context.textTheme.subtitle1.copyWith(
                  color: Colors.black26
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
