/*
 * Copyright 2020 Pedro Massango. All rights reserved.
 * Created by Pedro Massango on 10/7/2020.
 */

import 'package:app/src/application/projects/messages_view_model.dart';
import 'package:app/src/domain/core/message.dart';
import 'package:flutter/material.dart';
import 'package:build_context/build_context.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_cubit/flutter_cubit.dart';

import 'column_header.dart';
import 'error_view_widget.dart';

class MessagesColumn extends StatelessWidget {
  final ScrollController controller;

  const MessagesColumn({@required this.controller}) : assert(controller != null);

  void _onReloadProjectMessages(BuildContext context) {
    context.cubit<MessagesViewModel>().loadProjectMessages();
  }

  @override
  Widget build(BuildContext context) {
    final borderSide = ColumnHeader.borderSide;

    return Container(
      width: 300,
      decoration: BoxDecoration(border: Border(right: borderSide)),
      child: Column(
        children: [
          ColumnHeader(
            child: Container(
              decoration: BoxDecoration(color: context.primaryColor),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(
                      "Messages",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
            ),
          ),
          Expanded(
            child: CubitBuilder<MessagesViewModel, MessagesState>(
              builder: (context, state) {
                if (state.loadingProjectMessages) {
                  return Center(child: CircularProgressIndicator());
                } else if (state.hasFailure) {
                  return Center(
                      child: ErrorViewWidget('Failed to load Messages',
                        onTryAgain: () => _onReloadProjectMessages(context),
                      ),
                  );
                } else if (state.projectMessages.isEmpty) {
                  return Center(
                      child: Text('This project does not have messages.',
                        style: context.textTheme.caption,
                      ),
                  );
                }
                return ListView.separated(
                  key: ObjectKey(state.projectMessages),
                  controller: controller,
                  itemCount: state.projectMessages.length,
                  itemBuilder: (context, index) {
                    final item = state.projectMessages[index];
                    return _MessageListItem(message: item);
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

class _MessageListItem extends StatefulWidget {
  final Message message;

  const _MessageListItem({this.message});
  @override
  __MessageListItemState createState() => __MessageListItemState();
}

class __MessageListItemState extends State<_MessageListItem> {

  Message get message => widget.message;

  bool _isMouseHover = false;
  bool _editEnabled = false;

  @override
  Widget build(BuildContext context) {
    if (!_editEnabled) {
      return MouseRegion(
        onHover: (_) => setState(() => _isMouseHover = true),
        onExit: (_) => setState(() => _isMouseHover = false),
        child: SizedBox.fromSize(
          size: Size(double.maxFinite, 100),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(message.name),
                    Text(message.description, style: context.textTheme.caption),
                  ],
                ),
              ),
              Visibility(
                maintainSize: true,
                maintainState: true,
                maintainAnimation: true,
                visible: _isMouseHover,
                child: IconButton(
                  icon: Icon(Icons.edit),
                  iconSize: 20,
                  splashRadius: 16,
                  color: context.primaryColor,
                  onPressed: () {},
                ),
              )
            ],
          ),
        ),
      );
    }
    //TODO: return a widget to edit the current message
    return SizedBox.shrink();
  }
}
