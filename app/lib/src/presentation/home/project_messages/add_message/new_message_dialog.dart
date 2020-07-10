/*
 * Copyright 2020 Pedro Massango. All rights reserved.
 * Created by Pedro Massango on 10/7/2020.
 */

import 'package:app/src/application/projects/messages_view_model.dart';
import 'package:flutter/material.dart';
import 'package:build_context/build_context.dart';
import 'package:flutter_cubit/flutter_cubit.dart';

class NewMessageDialog extends StatefulWidget {
  @override
  _NewMessageDialogState createState() => _NewMessageDialogState();
}

class _NewMessageDialogState extends State<NewMessageDialog> {

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  void _onCreateProject(BuildContext context) {
    if (_nameController.text.trim().isNotEmpty &&
        _nameController.text.length > 1) {
      context.cubit<MessagesViewModel>().createNewProjectMessage(
        name: _nameController.text,
        description: _descriptionController.text,
      );
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          height: 260,
          width: 370,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8)
          ),
          child: Column(
            children: [
              Text('New message',
                style: context.textTheme.headline5,
              ),
              Spacer(),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'message_name',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  labelText: 'Message description',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox.fromSize(
                      size: Size(120, 40),
                      child: MaterialButton(
                        textColor: Colors.red,
                        child: Text('Cancel'),
                        onPressed: () => context.pop(context),
                      ),
                    ),

                    SizedBox.fromSize(
                      size: Size(120, 40),
                      child: MaterialButton(
                        textColor: context.primaryColor,
                        child: Text('Save'),
                        onPressed: () => _onCreateProject(context),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}