
import 'package:bestart/services/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController{

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

  void register(String email, String password){
    try{
      final isValid = formState.currentState!.validate();
      if(!isValid){
        print('not Enter here');
        return;
      }
      else{
        print('Enter here');
        _auth_service.registration(email, password);
        formState.currentState!.save();
      }
    }catch(e){
      print('Cant Add the user Firebase');
    }
  }

}