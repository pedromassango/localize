import 'package:app/src/ui/app_logo.dart';
import 'package:app/src/ui/circular_network_image.dart';
import 'package:flutter/material.dart';
import 'package:build_context/build_context.dart';

class SideBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = 200.0;

    return Container(
      width: width,
      height: context.mediaQuerySize.height,
      color: Color(0xff3d405b),
      child: Column(
        children: [
          Logo(),
          Divider(color: Colors.black12),
          Expanded(
            child: ListView(
              children: [
                // TODO: projects goes here
                _AddNewProjectButton()
              ],
            ),
          ),
          Spacer(),
          Divider(color: Colors.black12),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
            child: _AccountSection(),
          ),
        ],
      ),
    );
  }
}

class _AddNewProjectButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: MaterialButton(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Icon(Icons.add, color: Colors.white54),
            ),
            Text('New Project', style: context.textTheme.bodyText2.copyWith(
              color: Colors.white54
            )),
          ],
        ),
        onPressed: () {
          //TODO: start screen to create a new project
        },
      ),
    );
  }
}

class _AccountSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircularNetworkImage('https://avatars2.githubusercontent.com/u/33294549?s=460&u=c832597c58517e4eb4ad1df0c5c98b0998a973af&v=4'),
        Text('P. Massango', style: context.textTheme.subtitle2.copyWith(
          color: Colors.white
        ))
      ],
    );
  }
}

