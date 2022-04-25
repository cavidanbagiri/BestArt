
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/auth_service.dart';

class LoginPageController extends GetxController{

  //For Gettings User inputs
  late final email_controller;
  late final password_controller;

  //Global Key For Form Validation
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  //For Using Auth Service
  final _auth_service = AuthService();

  //Initialize this controller
  @override
  void onInit() {
    super.onInit();
    email_controller = TextEditingController();
    password_controller = TextEditingController();
  }

  //Email validate User
  String? validateEmail(String email){
    if(email.isEmpty){
      return 'Please Write Email';
    }
    return null;
  }
  //Password validate User
  String? validatePassword(String password){
    if(password.isEmpty){
      return 'Please Write Password';
    }
    return null;
  }

  Future<void> login(String email, String password)async{
    final isValid = await formState.currentState!.validate();
    if(!isValid) {
      return;
    }
    else{
      await _auth_service.loginFunc(email, password);
      formState.currentState!.save();
    }
  }

}