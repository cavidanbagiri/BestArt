import 'package:bestart/controller/login_page_controller.dart';
import 'package:bestart/routes/app_routes.dart';
import 'package:flutter/material.dart';
import '../../widgets/appbar_widget.dart';
import '../../widgets/drawer_widget.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginPageController> {

  LoginPage({Key? key}) : super(key: key);
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
                  child: Form(
                    key: controller.formState,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
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
                            decoration: InputDecoration(hintText: 'Email',
                            prefixIcon: Icon(Icons.email)),
                            controller: controller.email_controller,
                            validator: (value){
                              return controller.validateEmail(value!);
                            },
                          ),
                        ),
                        Container(
                          margin:
                              EdgeInsets.only(bottom: 10, left: 10, right: 20),
                          child: TextFormField(
                            decoration: InputDecoration(hintText: 'Password',
                            prefixIcon: Icon(Icons.password)),
                            controller: controller.password_controller,
                            validator: (value){
                              return controller.validatePassword(value!);
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              bottom: 20, left: 10, top: 20, right: 20),
                          child: ElevatedButton(
                            onPressed: () {
                              controller.login(controller.email_controller.text,controller.password_controller.text );
                            },
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
                ),
              ],
            ),
          ),
        ));
  }
}
