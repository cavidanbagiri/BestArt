import 'package:bestart/models/article_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ArticleService {
  //Create Firebase Core Instance
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  //Create Collection referance
  CollectionReference articles_references =
      FirebaseFirestore.instance.collection('allarticles');

  //Add Article to the page
  Future<void> addArticle(String title, String subject, String email) async {
    try {
      await articles_references.add({
        'title': title,
        'subject': subject,
        'email': email,
      });
      await Get.snackbar('Article Added', 'Article Added',
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text('Succesfully Added'),
          messageText: Text('Article Added'));
    } catch (e) {
      print('Article cant add and error is ${e}');
    }
  }

  //Read From Firebase
  Stream<List<ArticleModel>> getArticles(){
    return articles_references.snapshots().map((query){
      return query.docs.map((doc) {
        return ArticleModel.readData(doc);
      }).toList();
    });

  }

}
