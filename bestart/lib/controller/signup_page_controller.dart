
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'auth_controller.dart';

class SignUpController extends GetxController{

  //For Gettings User inputs
  late final email_controller;
  late final password_controller;

  //Global Key For Form Validation
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  //For Gettings Auth Controller
  final _auth_controller = AuthController();


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

  Future<void> register(String email, String password)async{
    try{
      final isValid = formState.currentState!.validate();
      if(!isValid){
        await Get.snackbar(
          'Success Resgister',
          'Success Regsitration',
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text('UnSuccess Resgister'),
          messageText: Text('UnSuccesfully Register On Website'),
          backgroundColor: Colors.red,
        );
        return;
      }
      else{
        print('Enter here');
        _auth_controller.registrationFunc(email, password);
        formState.currentState!.save();
      }
    }catch(e){
      print('Cant Add the user Firebase');
    }
  }

}