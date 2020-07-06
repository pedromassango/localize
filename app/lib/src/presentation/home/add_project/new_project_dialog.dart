/*
 * Copyright 2020 Pedro Massango. All rights reserved.
 * Created by Pedro Massango on 6/7/2020.
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
              Text('Give your project a name to get started.',
                style: context.textTheme.headline5,
              ),
              TextFormField(
                controller: _projectNameController,
                style: context.textTheme.headline6,
                decoration: InputDecoration(
                  hintText: 'App Name (2 characters min)',
                ),
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
                      child: Text('Create Project', style: TextStyle(color: Colors.white),),
                      color: context.primaryColor,
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

class AddNewProjectButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: MaterialButton(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Icon(Icons.add, color: Colors.white54),
            ),
            Text('New Project', style: context.textTheme.bodyText2.copyWith(
                color: Colors.white54
            )),
          ],
        ),
        onPressed: () {
          showDialog(context: context,
            builder: (context) => NewProjectDialog()
          );
        },
      ),
    );
  }
}
