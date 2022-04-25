
import 'package:bestart/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  //Create an instance to Login
  FirebaseAuth auth = FirebaseAuth.instance;

  //Create Regostration function
  Future<void> registrationFunc(String email, String password)async{
    try{
      await auth.createUserWithEmailAndPassword(email: email, password: password);
      Get.toNamed(Routes.LOGIN);
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
    }
    catch(e){
      print('Error happen in Auth Service');
    }
  }
}