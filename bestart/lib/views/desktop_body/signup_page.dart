
import 'package:flutter/material.dart';

import '../../widgets/appbar_widget.dart';
import '../../widgets/drawer_widget.dart';


class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      drawer: DrawerWidget(),
        body: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.6,
            height: MediaQuery.of(context).size.height * 0.8,
            color: Colors.white,
            child: Container(
              //color: Colors.greenAccent,
              width: MediaQuery.of(context).size.width * 0.3,
              height: MediaQuery.of(context).size.height * 0.8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 20, left: 10, top: 40),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin:
                    EdgeInsets.only(bottom: 10, left: 10, right: 20),
                    child: TextFormField(
                      decoration: InputDecoration(hintText: 'Email'),
                    ),
                  ),
                  Container(
                    margin:
                    EdgeInsets.only(bottom: 10, left: 10, right: 20),
                    child: TextFormField(
                      decoration: InputDecoration(hintText: 'Password'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}

