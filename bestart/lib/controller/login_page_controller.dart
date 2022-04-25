
import 'package:bestart/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginPageController extends GetxController{

  //For Gettings User inputs
  late final email_controller;
  late final password_controller;

  //Global Key For Form Validation
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  //For Gettings Auth Controller
  final _auth_controller = AuthController();

  //Create Get Storage Session and Adding Current User Email in the storage
  final current_user = GetStorage('current_user');

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
      await _auth_controller.loginFunc(email, password);
      formState.currentState!.save();
      current_user.write('email', email);
      current_user.write('isLogged', true);
    }
  }

}