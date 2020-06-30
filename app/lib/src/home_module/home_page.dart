import 'package:app/src/home_module/components/side_bar.dart';
import 'package:app/src/ui/app_logo.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SideBar(),
        ],
      ),
    );
  }
}
