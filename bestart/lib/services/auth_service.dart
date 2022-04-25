
import 'package:bestart/routes/app_routes.dart';
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
      print('Error happen in Auth Service ${e.toString()}');
    }
  }

  //Create Logout Function
  Future<void> logoutFunc()async{
    try{
      await auth.signOut();
    }
    catch(e){
      print('Logout Error ${e.toString()}');
    }
  }

}