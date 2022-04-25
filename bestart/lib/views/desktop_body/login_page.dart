
import 'package:flutter/material.dart';
import '../../widgets/appbar_widget.dart';
import '../../widgets/drawer_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      drawer: DrawerWidget(),
      body: Center(child: Text('Login Page From Desktop'),),
    );
  }
}
