/*
 * Copyright 2020 Pedro Massango. All rights reserved.
 * Created by Pedro Massango on 8/7/2020.
 */

import 'package:app/src/application/projects/languages_view_model.dart';
import 'package:app/src/domain/core/language.dart';
import 'package:app/src/domain/core/message.dart';
import 'package:app/src/domain/core/value_objects/unique_id.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cubit/flutter_cubit.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';

import 'widgets/languages_column.dart';
import 'widgets/messages_column.dart';

class ProjectMessagesTab extends StatefulWidget {

  @override
  _ProjectMessagesTabState createState() => _ProjectMessagesTabState();
}

class _ProjectMessagesTabState extends State<ProjectMessagesTab> {
  final _projectMessages = <Message> [
    Message.withEmptyDescription('app_name', UniqueId.fromString('1')),
    Message.withEmptyDescription('username', UniqueId.fromString('1')),
    Message.withEmptyDescription('username', UniqueId.fromString('1')),
    Message.withEmptyDescription('username', UniqueId.fromString('1')),
    Message.withEmptyDescription('username', UniqueId.fromString('1')),
    Message.withEmptyDescription('username', UniqueId.fromString('1')),
    Message.withEmptyDescription('username', UniqueId.fromString('1')),
    Message.withEmptyDescription('username', UniqueId.fromString('1')),
    Message.withEmptyDescription('username', UniqueId.fromString('1')),
    Message.withEmptyDescription('username', UniqueId.fromString('1')),
    Message.withEmptyDescription('first_name', UniqueId.fromString('1')),
    Message.withEmptyDescription('create_account', UniqueId.fromString('1')),
    Message(name: 'last_name', description: 'A user\'s last name', projectId: UniqueId.fromString('1')),
  ];

  LinkedScrollControllerGroup _controllersGroup;
  ScrollController _messages;
  Map<Object, ScrollController> _controllersByLanguageId = {};

  ScrollController _getCtl(Language lang) {
    if (_controllersByLanguageId.containsKey(lang.id)) {
      return _controllersByLanguageId[lang.id];
    }

    var controller = _controllersGroup.addAndGet();
    _controllersByLanguageId[lang.id] = controller;
    return controller;
  }

  @override
  void initState() {
    super.initState();
    _controllersGroup = LinkedScrollControllerGroup();
    _messages = _controllersGroup.addAndGet();
  }

  @override
  void dispose() {
    for (final c in _controllersByLanguageId.values) {
      c.dispose();
    }
    _messages.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MessagesColumn(
          messages: _projectMessages,
          controller: _messages,
        ),
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
                  final language = state.languages[index];
                  return LanguageColumn(
                    language: language,
                    projectMessages: _projectMessages,
                    controller: _getCtl(language),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
