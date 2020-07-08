/*
 * Copyright 2020 Pedro Massango. All rights reserved.
 * Created by Pedro Massango on 8/7/2020.
 */

import 'package:app/src/domain/core/message.dart';
import 'package:flutter/material.dart';
import 'package:build_context/build_context.dart';
import 'package:flutter/rendering.dart';

import 'column_header.dart';

class MessagesColumn extends StatelessWidget {
  final List<Message> messages;
  final ScrollController controller;

  const MessagesColumn({@required this.messages, this.controller});

  @override
  Widget build(BuildContext context) {
    final borderSide = BorderSide(color: Colors.grey.withOpacity(.5));

    return Container(
      width: 300,
      decoration: BoxDecoration(
          border: Border(
            right: borderSide,
            top: BorderSide(),
            bottom: borderSide,
          )
      ),
      child: Column(
        children: [
          ColumnHeader(
            child: RaisedButton(
              elevation: 0.0,
              child: Text('Add Message'),
              onPressed: () {},
            ),
          ),
          Expanded(
            child: ListView.separated(
              key: ObjectKey(messages),
              controller: controller,
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final item = messages[index];
                return _MessageListItem(message: item);
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
