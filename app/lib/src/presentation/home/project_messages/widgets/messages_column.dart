/*
 * Copyright 2020 Pedro Massango. All rights reserved.
 * Created by Pedro Massango on 7/7/2020.
 */

import 'package:app/src/domain/core/value_objects/message.dart';
import 'package:flutter/material.dart';
import 'package:build_context/build_context.dart';
import 'package:flutter/rendering.dart';

import 'column_header.dart';

class MessagesColumn extends StatelessWidget {
  final List<Message> messages;

  const MessagesColumn({@required this.messages});

  @override
  Widget build(BuildContext context) {
    final borderSide = BorderSide(color: Colors.grey);

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
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final item = messages[index];
                return _MessageListItem(message: item);
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

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (_) => setState(() => _isMouseHover = true),
      onExit: (_) => setState(() => _isMouseHover = false),
      child: ListTile(
        contentPadding: EdgeInsets.fromLTRB(4, 4, 0, 4),
        mouseCursor: MouseCursor.defer,
          title: Text(message.name, style: TextStyle(color: Colors.red)),
          leading: Visibility(
            visible: _isMouseHover,
            child: IconButton(
              icon: Icon(Icons.delete),
              iconSize: 20,
              splashRadius: 16,
              color: Colors.red,
              onPressed: () {},
            ),
          ),
          trailing: Visibility(
            visible: _isMouseHover,
            child: IconButton(
              icon: Icon(Icons.edit),
              iconSize: 20,
              splashRadius: 16,
              color: context.primaryColor,
              onPressed: () {},
            ),
          ),
      ),
    );
  }
}
