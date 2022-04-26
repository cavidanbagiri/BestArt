

import 'package:bestart/controller/article_controller.dart';
import 'package:get/get.dart';

class ArticleBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ArticleController());
  }


}