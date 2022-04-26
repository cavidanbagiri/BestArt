
import 'package:bestart/models/article_model.dart';
import 'package:bestart/services/article_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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

  //Create Article Modul instance list
  RxList<ArticleModel>? article_model_list = RxList<ArticleModel>([]);

  @override
  onInit(){
    title_controller = TextEditingController();
    subject_controller = TextEditingController();
    article_model_list?.bindStream(_article_service.getArticles());
    print('article cont work and ${current_user.read('email')}');
    super.onInit();
  }

  //Read From Data
  void readdata(){
    print('Read data work');
    for(int i=0;i<article_model_list!.length;i++){
      print(article_model_list![i].id);
      print(article_model_list![i].title);
      print(article_model_list![i].subject);
    }
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