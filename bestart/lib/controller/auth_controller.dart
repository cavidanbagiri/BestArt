

import 'package:bestart/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../services/auth_service.dart';

class AuthController extends GetxController{

  //For Using Auth Service
  final auth_service = AuthService();

  //Create an instance for Auth Controller
  static AuthController instance = Get.find<AuthController>();

  //Create GetStorage
  final my_current_user = GetStorage('current_user');

  //For Login
  Future<void> loginFunc(String email, String password)async{
    try{
      await auth_service.loginFunc(email, password);
      await my_current_user.write('isLogged',true);
      print('from login ${my_current_user.read('isLogged')}');
      print('from login ${my_current_user.read('email')}');
    }
    catch(e){
      print('Error inside of auth_controller');
    }
  }

  Future<void> logoutFunc()async{
    try{
      await auth_service.logoutFunc();
      await my_current_user.write('isLogged',false);
      await my_current_user.write('email',null);
      print('from logout ${my_current_user.read('isLogged')}');
      print('from logout ${my_current_user.read('email')}');
      await Get.toNamed(Routes.LOGIN);
    }
    catch(e){
      print('Logout Happen ${e.toString()}');
    }
  }


  //For Registration
  Future<void> registrationFunc(String email, String password)async{
    try{
      await auth_service.registrationFunc(email, password);
    }
    catch(e){
      print('Error inside of auth_controller');
    }
  }

}
