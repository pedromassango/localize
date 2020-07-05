/*
 * Copyright 2020 Pedro Massango. All rights reserved.
 * Created by Pedro Massango on 5/7/2020.
 */

import 'package:app/src/application/projects/project_overview/project_overview_view_model.dart';
import 'package:app/src/application/projects/projects_view_model.dart';
import 'package:app/src/domain/core/language.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:build_context/build_context.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'add_language_dialog.dart';

class ProjectOverViewTab extends StatefulWidget {
  @override
  _ProjectOverViewTabState createState() => _ProjectOverViewTabState();
}

class _ProjectOverViewTabState extends State<ProjectOverViewTab> {
  final projectsViewModel = Modular.get<ProjectsViewModel>();

  final languagesViewModel = Modular.get<ProjectOverviewViewModel>();

  @override
  void initState() {
    super.initState();
    languagesViewModel.loadProjectLanguages(projectsViewModel.selectedProject.id);
  }

  @override
  Widget build(BuildContext context) {
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
                  controller: TextEditingController(text: projectsViewModel.selectedProject.name),
                  decoration: InputDecoration(
                    labelText: 'Project Name',
                    border: OutlineInputBorder()
                  ),
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
            child: Observer(
              builder: (context) {
                return ListView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.all(8),
                  semanticChildCount: languagesViewModel.languages.length,
                  children: <Widget>[AddLanguageButtonCard()]..addAll(languagesViewModel.languages.map((element) {
                    return _LanguageInfoListItem(language: element);
                  }).toList()),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class _LanguageInfoListItem extends StatelessWidget {
  final Language language;

  const _LanguageInfoListItem({this.language});

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
            child: Text(language.name),
          ),
          Text('${language.messagesCount} strings', style: context.textTheme.caption)
        ],
      ),
    );
  }
}
