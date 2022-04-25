import 'package:bestart/controller/signup_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/appbar_widget.dart';
import '../../widgets/drawer_widget.dart';

class SignUpPage extends GetView<SignUpController> {
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
          child: Form(
            key: controller.formState,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: SizedBox(
              //color: Colors.greenAccent,
              width: MediaQuery.of(context).size.width * 0.3,
              height: MediaQuery.of(context).size.height * 0.8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 20, left: 10, top: 40),
                    child: const Text(
                      'Sign Up',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 10, left: 10, right: 20),
                    child: TextFormField(
                      decoration: const InputDecoration(hintText: 'Email'),
                      controller: controller.email_controller,
                      validator: (value) {
                        return controller.validateEmail(value!);
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 10, left: 10, right: 20),
                    child: TextFormField(
                      decoration: const InputDecoration(hintText: 'Password'),
                      controller: controller.password_controller,
                      validator: (value) {
                        return controller.validatePassword(value!);
                      },
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        controller.register(controller.email_controller.text,
                            controller.password_controller.text);
                      },
                      child: const Text('Sign Up'))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
