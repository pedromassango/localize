/*
 * Copyright 2020 Pedro Massango. All rights reserved.
 * Created by Pedro Massango on 5/7/2020.
 */

import 'package:app/src/application/projects/project_overview/project_overview_view_model.dart';
import 'package:app/src/application/projects/projects_view_model.dart';
import 'package:app/src/domain/core/language.dart';
import 'package:app/src/utils/language_utils.dart';
import 'package:flutter/material.dart';
import 'package:build_context/build_context.dart';
import 'package:flutter_modular/flutter_modular.dart';

class NewLanguageDialog extends StatefulWidget {
  @override
  _NewLanguageDialogState createState() => _NewLanguageDialogState();
}

class _NewLanguageDialogState extends State<NewLanguageDialog> {

  Language _selectedLanguage;
  static const _supportedLanguages = allLanguages;

  void _onCreateLanguage(BuildContext context) {
    if (_selectedLanguage != null) {
      final projectsViewModel = Modular.get<ProjectsViewModel>();
      Modular.get<ProjectOverviewViewModel>()
      .saveLanguage(projectsViewModel.selectedProject, _selectedLanguage);
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          height: 250,
          width: 350,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('New Language',
                style: context.textTheme.headline5,
              ),
              DropdownButton<Language>(
                value: _selectedLanguage,
                hint: Text('Language'),
                items: _supportedLanguages.map((language) {
                  return DropdownMenuItem(
                    value: language,
                    child: Text(language.nameAndCode),
                  );
                }).toList(),
                onChanged: (language) {
                  setState(() {
                    _selectedLanguage = language;
                  });
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: SizedBox.fromSize(
                      size: Size(120, 40),
                      child: RaisedButton(
                        child: Text('Cancel', style: TextStyle(color: Colors.white),),
                        color: Colors.red,
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ),

                  SizedBox.fromSize(
                    size: Size(120, 40),
                    child: RaisedButton(
                      child: Text('Save', style: TextStyle(color: Colors.white),),
                      color: context.primaryColor,
                      onPressed: () => _onCreateLanguage(context),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AddLanguageButtonCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final itemSize = Size(200, 260);
    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: (_) => NewLanguageDialog()
        );
      },
      child: Container(
        width: itemSize.width,
        height: itemSize.height,
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
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
      ),
    );
  }
}