
import 'package:bestart/models/article_model.dart';
import 'package:bestart/services/article_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ArticleController extends GetxController{

  //Create an Auth Service
  final _article_service = ArticleService();

  //Create static instance
  static ArticleController get instance => Get.find<ArticleController>();

  //Create Get Storage For taking User email
  final current_user = GetStorage('current_user');

  //Firebase Auth
  FirebaseAuth auth = FirebaseAuth.instance;

  //Create Controller
  TextEditingController? title_controller;
  TextEditingController? subject_controller;

  //Create Article Modul instance list
  RxList<ArticleModel>? article_model_list = RxList<ArticleModel>([]);

  //For updating raiting with obx
  RxInt rate=0.obs;

  @override
  onInit(){
    title_controller = TextEditingController();
    subject_controller = TextEditingController();
    article_model_list?.bindStream(_article_service.getArticles());
    super.onInit();
  }

  //Voute App
  Future<void> vouteAppRaiting(String ?id, int raiting)async{
    try{
      await _article_service.vouteAppRaiting(id, raiting, auth.currentUser!.email.toString());
    }
    catch(e){
      print('upp error');
    }
    update();
  }

  //Voute App
  Future<void> vouteDownRaiting(String ?id, int raiting)async{
    try{
      await _article_service.vouteDownRaiting(id, raiting, auth.currentUser!.email.toString());
    }catch(e){
      print('down error');
    }
    update();
  }

  //Add Article ro Firebase
  Future<void> addArticle(String title, String subject)async{
    try{
      _article_service.addArticle(title, subject, auth.currentUser!.email.toString());
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