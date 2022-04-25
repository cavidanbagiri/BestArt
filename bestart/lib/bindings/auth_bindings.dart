

import 'package:bestart/controller/auth_controller.dart';
import 'package:get/get.dart';

class AuthBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>AuthController());
  }

}