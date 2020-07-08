/*
 * Copyright 2020 Pedro Massango. All rights reserved.
 * Created by Pedro Massango on 8/7/2020.
 */

import 'package:app/src/domain/core/language.dart';
import 'package:app/src/domain/core/message.dart';
import 'package:flutter/material.dart';
import 'package:build_context/build_context.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'column_header.dart';

class LanguageColumn extends StatelessWidget {
  final Language language;
  final List<Message> projectMessages;
  final ScrollController controller;

  const LanguageColumn({this.language, this.projectMessages, this.controller});

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
          Expanded(
            child: ListView.separated(
              key: ObjectKey(language),
              controller: controller,
              itemCount: projectMessages.length,
              itemBuilder: (context, index) {
                return _LanguageMessageListItem(message: projectMessages[index]);
              },
              separatorBuilder: (context, index) {
                return Container(color: Colors.grey.withOpacity(.2), height: 0.5);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _LanguageMessageListItem extends StatefulWidget {
  final Message message;

  const _LanguageMessageListItem({this.message});

  @override
  __LanguageMessageListItemState createState() => __LanguageMessageListItemState();
}

class __LanguageMessageListItemState extends State<_LanguageMessageListItem> {

  final TextEditingController _controller = TextEditingController();
  final FocusNode _editFocusNode = FocusNode();

  bool _isMouseHover = false;
  bool _enableTextField = false;
  bool _canSaveChanges = false;

  void _onEditPressed() {
    setState(() {
      _enableTextField = true;
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _editFocusNode.requestFocus();
    });
  }

  void _onSavePressed() {
    setState(() {
      _enableTextField = false;
      _canSaveChanges = false;
    });
  }

  // TODO: this can be optimized
  void _onTextFieldChanged(String value) {
    if (value.trim().isNotEmpty) {
      setState(() {
        _canSaveChanges = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (_) => setState(() => _isMouseHover = true),
      onExit: (_) => setState(() => _isMouseHover = false),
      child: SizedBox.fromSize(
        size: Size(double.maxFinite, 100),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 8, 16),
                  child: TextField(
                    enabled: _enableTextField,
                    maxLines: 4,
                    focusNode: _editFocusNode,
                    style: context.textTheme.bodyText2,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      disabledBorder: InputBorder.none,
                      border: InputBorder.none,
                    ),
                    onChanged: _onTextFieldChanged,
                  ),
                ),
              ),
              Column(
                children: [
                  Visibility(
                    visible: _isMouseHover && !_enableTextField,
                    child: IconButton(
                      icon: Icon(Icons.edit),
                      iconSize: 20,
                      splashRadius: 16,
                      color: context.primaryColor,
                      onPressed: _onEditPressed,
                    ),
                  ),
                  Visibility(
                    maintainSize: true,
                    maintainState: true,
                    maintainAnimation: true,
                    visible: _isMouseHover && _canSaveChanges,
                    child: IconButton(
                      icon: Icon(Icons.save),
                      iconSize: 20,
                      splashRadius: 16,
                      color: Colors.green,
                      onPressed: _onSavePressed,
                    ),
                  ),
                ],
              ),
            ],
          ),
      ),
    );
  }
}

