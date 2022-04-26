
import 'package:bestart/services/article_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ArticleController extends GetxController{

  //Create an Auth Service
  final _article_service = ArticleService();
  
  //Create Get Storage For taking User email
  final current_user = GetStorage('current_user');

  //Create Controller
  TextEditingController? title_controller;
  TextEditingController? subject_controller;

  @override
  onInit(){
    title_controller = TextEditingController();
    subject_controller = TextEditingController();
    print('article cont work and ${current_user.read('email')}');
    super.onInit();
  }

  //Add Article ro Firebase
  Future<void> addArticle(String title, String subject, String email)async{
    try{
      _article_service.addArticle(title, subject, email);
    }catch(e){
      print('Error Happen Inside ArticleController ${e.toString()}');
    }
  }

  @override
  void onClose() {
    title_controller?.dispose();
    subject_controller?.dispose();
    super.onClose();
  }

}