import 'package:app/src/home_module/components/side_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static String route = '/home';

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
