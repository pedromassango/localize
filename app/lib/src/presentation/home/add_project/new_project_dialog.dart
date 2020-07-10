/*
 * Copyright 2020 Pedro Massango. All rights reserved.
 * Created by Pedro Massango on 10/7/2020.
 */

import 'package:app/src/application/projects/projects_view_model.dart';
import 'package:flutter/material.dart';
import 'package:build_context/build_context.dart';
import 'package:flutter_cubit/flutter_cubit.dart';

class NewProjectDialog extends StatefulWidget {
  @override
  _NewProjectDialogState createState() => _NewProjectDialogState();
}

class _NewProjectDialogState extends State<NewProjectDialog> {

  final TextEditingController _projectNameController = TextEditingController();

  void _onCreateProject(BuildContext context) {
    if (_projectNameController.text.trim().isNotEmpty &&
        _projectNameController.text.length > 1) {
      context.cubit<ProjectsViewModel>().saveProject(_projectNameController.text);
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
            children: [
              Text('What is the name of your App?',
                style: context.textTheme.headline5,
              ),
              TextFormField(
                controller: _projectNameController,
                style: context.textTheme.headline6,
                decoration: InputDecoration(
                  hintText: 'App name (2 characters min)',
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox.fromSize(
                    size: Size(120, 40),
                    child: MaterialButton(
                      child: Text('Cancel'),
                      textColor: Colors.red,
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  SizedBox.fromSize(
                    size: Size(120, 40),
                    child: MaterialButton(
                      child: Text('Create'),
                      textColor: context.primaryColor,
                      onPressed: () => _onCreateProject(context),
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