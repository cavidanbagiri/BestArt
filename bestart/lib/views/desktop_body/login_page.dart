import 'package:bestart/routes/app_routes.dart';
import 'package:flutter/material.dart';
import '../../widgets/appbar_widget.dart';
import '../../widgets/drawer_widget.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

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
            child: Row(
              children: [
                //image Side
                Container(
                  //color: Colors.red,
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: Image.asset('assets/img/logo.jpg'),
                ),
                //Sign In Side
                Container(
                  //color: Colors.greenAccent,
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 20, left: 10, top: 40),
                        child: Text(
                          'Sign In',
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
                      Container(
                        margin: EdgeInsets.only(
                            bottom: 20, left: 10, top: 20, right: 20),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text('Sign In'),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(
                              bottom: 20, left: 10, top: 20, right: 20),
                          child: Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                  child: Text('Don\'t You Have An Account?'),
                                  onTap: () {},
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(right: 10),
                                  child: TextButton(
                                    onPressed: () {
                                      Get.toNamed(Routes.SIGNUP);
                                    },
                                    child: Text('Sign Up'),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
