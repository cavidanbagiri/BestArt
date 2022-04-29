


import 'package:bestart/controller/article_controller.dart';
import 'package:bestart/controller/article_detail_controller.dart';
import 'package:get/get.dart';

class ArticleDetailBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ArticleDetailController());
  }


}
