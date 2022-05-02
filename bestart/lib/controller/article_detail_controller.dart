
import 'package:cloud_firestore/cloud_firestore.dart';
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

  late Rx<ArticleModel> temp;

  CollectionReference articles_references =
  FirebaseFirestore.instance.collection('allarticles');

  var raiting_cont = 0.obs;

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
      raiting_cont.value = raiting_cont.value+1;
    }
    catch(e){
      print('upp error ${e}');
    }
    //update();
  }

  Future<void> vouteDownRaiting(String ?id, int raiting)async{
    try{
      await _article_service.vouteDownRaiting(id, raiting);
    }catch(e){
      print('down error ${e}');
    }
    //update();
  }

  //read with article id
  Future<Rx<ArticleModel>> getArticleWithId(String id)async{
    final current_article = await articles_references.doc(id);
    final snapshot = await current_article.get();
    temp = ArticleModel.readData(snapshot).obs;
    raiting_cont.value = temp.value.raiting;
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