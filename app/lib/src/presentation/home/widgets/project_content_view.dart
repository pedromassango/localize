/*
 * Copyright 2020 Pedro Massango. All rights reserved.
 * Created by Pedro Massango on 8/7/2020.
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
    final borderSide = BorderSide(color: Colors.grey.withOpacity(.5), width: 0.5);

    return DefaultTabController(
      initialIndex: _currentTabIndex,
      length: _tabs.length,
      child: Scaffold(
        appBar: _ProjectToolBar(
          tabTitles: _tabs,
          projectName: widget.project.name,
          preferredSize: Size(context.mediaQuerySize.width, 41),
          onTabSelected: (index) => setState(() => _currentTabIndex = index),
        ),
        body: Container(
          padding: const EdgeInsets.only(top: 32),
          decoration: BoxDecoration(
            border: Border(
              bottom: borderSide,
              left: borderSide,
              right: borderSide
            )
          ),
          child: IndexedStack(
            index: _currentTabIndex,
            children: [
              ProjectOverViewTab(),
              ProjectMessagesTab(),
            ],
          ),
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
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 40,
            width: preferredSize.width * .3,
            child: TabBar(
              labelColor: context.primaryColor,
              indicatorWeight: 3,
              isScrollable: false,
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
          Container(width: double.maxFinite, height: 1, color: Colors.grey.withOpacity(.2))
        ],
      ),
    );
  }
}
