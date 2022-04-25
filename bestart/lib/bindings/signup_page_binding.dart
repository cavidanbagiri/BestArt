
import 'package:bestart/controller/signup_page_controller.dart';
import 'package:get/get.dart';

class SignUpBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>SignUpController());
  }
}