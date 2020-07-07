/*
 * Copyright 2020 Pedro Massango. All rights reserved.
 * Created by Pedro Massango on 7/7/2020.
 */

import 'package:app/src/application/projects/languages_view_model.dart';
import 'package:app/src/domain/core/value_objects/message.dart';
import 'package:app/src/domain/core/value_objects/unique_id.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cubit/flutter_cubit.dart';

import 'widgets/languages_column.dart';
import 'widgets/messages_column.dart';

class ProjectMessagesTab extends StatelessWidget {

  final _projectMessages = <Message> [
    Message.withEmptyDescription('app_name', UniqueId.fromString('1')),
    Message.withEmptyDescription('username', UniqueId.fromString('1')),
    Message.withEmptyDescription('first_name', UniqueId.fromString('1')),
    Message.withEmptyDescription('create_account', UniqueId.fromString('1')),
    Message(name: 'last_name', description: 'A user\'s last name', projectId: UniqueId.fromString('1')),
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MessagesColumn(messages: _projectMessages),
        Expanded(
          child: CubitBuilder<LanguagesViewModel, LanguagesState>(
            builder: (context, state) {
              if (state.isLoadingLanguages) {
                return SizedBox.shrink();
              } else if (state.loadLanguageFailure != null) {
                return SizedBox.shrink();
              }
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.languages.length,
                itemBuilder: (context, index) {
                  return LanguageColumn(language: state.languages[index]);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
