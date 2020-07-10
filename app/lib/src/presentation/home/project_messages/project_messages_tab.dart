/*
 * Copyright 2020 Pedro Massango. All rights reserved.
 * Created by Pedro Massango on 9/7/2020.
 */

import 'package:app/src/application/projects/languages_view_model.dart';
import 'package:app/src/application/projects/messages_view_model.dart';
import 'package:app/src/domain/core/language.dart';
import 'package:app/src/domain/core/message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cubit/flutter_cubit.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';

import 'widgets/languages_column.dart';
import 'widgets/messages_column.dart';
import 'package:build_context/build_context.dart';

class ProjectMessagesTab extends StatefulWidget {

  @override
  _ProjectMessagesTabState createState() => _ProjectMessagesTabState();
}

class _ProjectMessagesTabState extends State<ProjectMessagesTab> {

  LinkedScrollControllerGroup _controllersGroup;
  ScrollController _messagesController;
  Map<Object, ScrollController> _controllersByLanguageId = {};

  ScrollController _getScrollController(Language lang) {
    if (_controllersByLanguageId.containsKey(lang.id)) {
      return _controllersByLanguageId[lang.id];
    }

    var controller = _controllersGroup.addAndGet();
    _controllersByLanguageId[lang.id] = controller;
    return controller;
  }

  void _onLoadLanguages(BuildContext context) {
    context.cubit<LanguagesViewModel>().loadProjectLanguages();
  }

  @override
  void initState() {
    super.initState();
    _controllersGroup = LinkedScrollControllerGroup();
    _messagesController = _controllersGroup.addAndGet();
  }

  @override
  void dispose() {
    for (final c in _controllersByLanguageId.values) {
      c.dispose();
    }
    _messagesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 16, 16),
            child: SizedBox(
              height: 40,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: CubitBuilder<MessagesViewModel, MessagesState>(
                  buildWhen: (prev, cur) => prev.loadingProjectMessages != cur.loadingProjectMessages,
                  builder: (context, state) {
                    return RaisedButton(
                      color: context.primaryColor,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.add, color: Colors.white),
                          Text('New Message', style: context.textTheme.caption.copyWith(
                              color: Colors.white
                          ),),
                        ],
                      ),
                      onPressed: state.loadingProjectMessages ?  null : () { },
                    );
                  },
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: [
              MessagesColumn(
                controller: _messagesController,
              ),
              Expanded(
                child: CubitBuilder<LanguagesViewModel, LanguagesState>(
                  builder: (context, state) {
                    if (state.isLoadingLanguages) {
                      return SizedBox.shrink();
                    } else if (state.loadLanguageFailure != null) {
                      return Center(
                        child: ErrorViewWidget('Unable to load Languages.',
                          onTryAgain: () => _onLoadLanguages(context),
                        ),
                      );
                    }
                    final languagesSize = state.languages.length;
                    return ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: languagesSize,
                      itemBuilder: (context, index) {
                        final language = state.languages[index];
                        return LanguageColumn(
                          language: language,
                          controller: _getScrollController(language),
                        );
                      },
                      separatorBuilder: (c, i) {
                        return Container(width: .2, color: Colors.black12);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
