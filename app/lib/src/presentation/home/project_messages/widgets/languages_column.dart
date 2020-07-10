/*
 * Copyright 2020 Pedro Massango. All rights reserved.
 * Created by Pedro Massango on 10/7/2020.
 */

import 'package:app/src/application/projects/messages_view_model.dart';
import 'package:app/src/domain/core/language.dart';
import 'package:app/src/domain/core/message.dart';
import 'package:app/src/domain/core/message_value.dart';
import 'package:flutter/material.dart';
import 'package:build_context/build_context.dart';
import 'package:flutter_cubit/flutter_cubit.dart';

import 'column_header.dart';

class LanguageColumn extends StatelessWidget {
  final Language language;
  final ScrollController controller;

  const LanguageColumn({
    @required this.language,
    @required this.controller,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      width: 350,
      decoration: BoxDecoration(border: Border(top: ColumnHeader.borderSide)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ColumnHeader(
            child: Container(
              decoration: BoxDecoration(
                border: Border(bottom: ColumnHeader.borderSide),
              ),
              padding: EdgeInsets.only(right: 16, left: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(language.name,
                    style: context.textTheme.headline6.copyWith(
                        fontSize: 16,
                        color: context.primaryColor,
                    ),
                  ),
                  Text('${language.messagesCount}/173',
                    style: context.textTheme.caption.copyWith(
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: CubitBuilder<MessagesViewModel, MessagesState>(
              builder: (context, state) {
                if (state.loadingProjectMessages || state.hasFailure) {
                  return SizedBox.shrink();
                }
                return ListView.separated(
                  key: ObjectKey(language),
                  controller: controller,
                  itemCount: state.projectMessages.length,
                  itemBuilder: (context, index) {
                    // TODO: parse language message value to this item
                    return _LanguageMessageListItem();
                  },
                  separatorBuilder: (context, index) {
                    return Container(color: Colors.grey.withOpacity(.2), height: .5);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _LanguageMessageListItem extends StatefulWidget {
  final MessageValue messageValue;

  const _LanguageMessageListItem({this.messageValue});

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
                    controller: _controller,
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

