/*
 * Copyright 2020 Pedro Massango. All rights reserved.
 * Created by Pedro Massango on 7/7/2020.
 */

import 'package:app/src/domain/core/project.dart';
import 'package:app/src/presentation/home/project_messages/project_messages_tab.dart';
import 'package:app/src/presentation/home/project_overview/project_overview_tab.dart';
import 'package:flutter/material.dart';
import 'package:build_context/build_context.dart';

class ProjectContentView extends StatefulWidget {
  final Project project;

  const ProjectContentView({this.project}) :
        assert(project != null, 'project must not be null in project content view.');

  @override
  _ProjectContentViewState createState() => _ProjectContentViewState();
}

class _ProjectContentViewState extends State<ProjectContentView>
  with TickerProviderStateMixin {

  final _tabs = ['Overview', 'Messages'];

  int _currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        appBar: _ProjectToolBar(
          tabTitles: _tabs,
          projectName: widget.project.name,
          preferredSize: Size(context.mediaQuerySize.width, 130),
          onTabSelected: (index) => setState(() => _currentTabIndex = index),
        ),
        body: IndexedStack(
          index: _currentTabIndex,
          children: [
            ProjectOverViewTab(),
            ProjectMessagesTab(),
          ],
        )
      ),
    );
  }
}

class _ProjectToolBar extends PreferredSize {
  final String projectName;
  final List<String> tabTitles;
  final ValueChanged<int> onTabSelected;

  @override
  final Size preferredSize;

  const _ProjectToolBar({
    this.preferredSize,
    this.projectName,
    this.tabTitles,
    this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      width: preferredSize.width,
      margin: EdgeInsets.only(top: 28, left: 24, right: 32),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(projectName,
            style: context.textTheme.headline6.copyWith(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 70,
                width: preferredSize.width * .3,
                child: TabBar(
                  labelColor: context.primaryColor,
                  indicatorWeight: 3,
                  isScrollable: false,
                  physics: NeverScrollableScrollPhysics(),
                  indicatorPadding: EdgeInsets.all(0.0),
                  indicatorColor: context.primaryColor,
                  unselectedLabelColor: context.primaryColor,
                  onTap: onTabSelected,
                  tabs: tabTitles.map((title) {
                    return Tab(
                      text: title,
                    );
                  }).toList(),
                ),
              ),
              _Buttons(),
            ],
          ),
        ],
      ),
    );
  }
}

class _Buttons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox.fromSize(
          size: Size(130, 40),
          child: RaisedButton(
            color: context.primaryColor,
            splashColor: Colors.white12,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4)
            ),
            child: Text('New Language', style: TextStyle(color: Colors.white)),
            onPressed: () {},
          ),
        ),
        Padding(padding: EdgeInsets.only(left: 8)),
        SizedBox(
          height: 40,
          child: RaisedButton(
            color: context.primaryColor,
            splashColor: Colors.white12,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4)
            ),
            child: Text('Import Language File', style: TextStyle(color: Colors.white)),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
