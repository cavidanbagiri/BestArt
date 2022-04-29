
import 'package:bestart/controller/login_page_controller.dart';
import 'package:get/get.dart';

class LoginPageBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>LoginPageController());
  }
}
