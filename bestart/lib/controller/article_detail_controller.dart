
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/article_model.dart';
import '../services/article_service.dart';

class ArticleDetailController extends GetxController{
  //Create an Auth Service
  final _article_service = ArticleService();

  //Create Controller
  TextEditingController? title_controller;
  TextEditingController? subject_controller;

  var temp;

  //For updating raiting with obx
  RxInt rate=0.obs;

  @override
  onInit(){
    title_controller = TextEditingController();
    subject_controller = TextEditingController();
    super.onInit();
  }

  //Voute App
  Future<void> vouteAppRaiting(String ?id, int raiting)async{
    try{
      await _article_service.vouteAppRaiting(id, raiting);
      rate.value = raiting+1;
    }
    catch(e){
      print('upp error');
    }
    update();
  }

  //Voute App
  Future<void> vouteDownRaiting(String ?id, int raiting)async{
    try{
      await _article_service.vouteDownRaiting(id, raiting);
      rate.value = raiting-1;
    }catch(e){
      print('down error');
    }
    update();
  }

  //read with article id
  Future<ArticleModel?> getArticleWithId(String id)async{
    temp= await _article_service.getArticleWithId(id);
    return temp;
  }

  @override
  void onClose() {
    title_controller?.dispose();
    subject_controller?.dispose();
    super.onClose();
  }

//Create static instance
}