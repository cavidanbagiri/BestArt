

import 'package:bestart/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';

import '../../widgets/appbar_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      drawer: DrawerWidget(),
      body: Center(child: Text('Home page for desktop'),),
    );
  }
}
