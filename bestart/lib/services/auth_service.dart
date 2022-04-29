
import 'package:bestart/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_storage/get_storage.dart';

class AuthService {

  //Create an instance to Login
  FirebaseAuth auth = FirebaseAuth.instance;

  //Create getStdorage For logout Function
  final mycurrent_user = GetStorage('current_user');

  //Create Regostration function
  Future<void> registrationFunc(String email, String password)async{
    try{
      await auth.createUserWithEmailAndPassword(email: email, password: password);
      Get.toNamed(Routes.LOGIN);
      await Get.snackbar(
        'Success Resgister',
        'Success Regsitration',
        snackPosition: SnackPosition.BOTTOM,
        titleText: Text('Success Resgister'),
        messageText: Text('Succesfully Register On Website'),
        backgroundColor: Colors.green,
      );
    }
    catch(e){
      print('Error From Auth Service');
    }
  }

  //Create Login Function
  Future<void> loginFunc(String email, String password)async{
    try{
      await auth.signInWithEmailAndPassword(email: email, password: password);
      Get.toNamed(Routes.HOME);
      await Get.snackbar(
        'Success Resgister',
        'Success Regsitration',
        snackPosition: SnackPosition.BOTTOM,
        titleText: Text('Success Login'),
        messageText: Text('Succesfully Login On Website'),
        backgroundColor: Colors.green,
      );
    }
    catch(e){
      print('Error happen in Auth Service ${e.toString()}');
      await Get.snackbar(
        'Success Resgister',
        'Success Regsitration',
        snackPosition: SnackPosition.BOTTOM,
        titleText: Text('UnSuccess Login'),
        messageText: Text('UNSuccesfully Login On Website'),
        backgroundColor: Colors.red,
      );
    }
  }

  //Create Logout Function
  Future<void> logoutFunc()async{
    try{
      await auth.signOut();
      print('${auth.currentUser!.email} is happened');
    }
    catch(e){
      print('Logout Error ${e.toString()}');
    }
  }

}