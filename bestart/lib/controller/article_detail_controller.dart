
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/article_model.dart';
import '../services/article_service.dart';

class ArticleDetailController extends GetxController{
  //Create an Auth Service
  final _article_service = ArticleService();

  //Take Current Article and equal this val
  late Rx<ArticleModel> temp;

  //Create Comment Controller
  var comment_controller ;

  //For Taking email
  FirebaseAuth auth = FirebaseAuth.instance;

  CollectionReference articles_references =
  FirebaseFirestore.instance.collection('allarticles');

  @override
  onInit(){
    comment_controller = TextEditingController();
    super.onInit();
  }

  //Add Comment
  Future<void> addComment(String ?id, String comment)async{
    _article_service.saddComment(id, comment, auth.currentUser!.email.toString());
  }

  //Raiting Up
  Future<void> vouteAppRaiting(String ?id, int raiting)async{
    try{
      await _article_service.vouteAppRaiting(id, raiting);
    }
    catch(e){
      print('upp error ${e}');
    }
    //update();
  }

  //Raiting Down
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
    return temp;
  }

  @override
  void onClose() {
    super.onClose();
  }

//Create static instance
}