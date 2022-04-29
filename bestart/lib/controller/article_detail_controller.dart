

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../models/article_model.dart';
import '../services/article_service.dart';

class ArticleDetailController extends GetxController{
  //Create an Auth Service
  final _article_service = ArticleService();

  //Create Get Storage For taking User email
  //final current_user = GetStorage('current_user');

  //Create Controller
  TextEditingController? title_controller;
  TextEditingController? subject_controller;

  ArticleModel? temp;

  @override
  onInit(){
    title_controller = TextEditingController();
    subject_controller = TextEditingController();
    super.onInit();
  }

  //read with article id
  Future<ArticleModel?> getArticleWithId(String id)async{
    temp= await _article_service.getArticleWithId(id) as ArticleModel;
    print('here');
    print(temp?.title.toString());
    return temp;
  }

  //

  @override
  void onClose() {
    title_controller?.dispose();
    subject_controller?.dispose();
    super.onClose();
  }

//Create static instance
}