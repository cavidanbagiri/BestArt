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
        'raiting':0
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
    try{
      return articles_references.snapshots().map((query){
        return query.docs.map((doc) {
          return ArticleModel.readData(doc);
        }).toList();
      });
    }
    catch(e){
      print('error happeb here ${e.toString()}');
      return articles_references.snapshots().map((query){
        return query.docs.map((doc) {
          return ArticleModel.readData(doc);
        }).toList();
      });
    }
  }

  //Read With Article
  @deprecated
  Future<Rx<ArticleModel>> getArticleWithId(String id)async{
    final current_article = await articles_references.doc(id);
    final snapshot = await current_article.get();
    return ArticleModel.readData(snapshot).obs;
    //await _article_service.getArticleWithId(id);
  }

  //Add Comment
  Future<void> saddComment(String ?id, String comment, String email)async{
    try{
      final current_article = await articles_references.doc(id);
      current_article.update(
        {'comments' :
          FieldValue.arrayUnion(
            [{email:comment}]
          )
        }
      );
    }
    catch(e){
      print('Comment adding error os ${e}');
    }
  }

  //Voute App
  Future<void> vouteAppRaiting(String ?id, int raiting, String email)async{
    try{
      final current_article = await articles_references.doc(id);
      current_article.update({
        'raiting':
          FieldValue.arrayUnion([
           email
          ])
      }).then((value) => print('operation execute')).catchError(()=>print('error happen'));
      //print('execute command');
    }
    catch(e){
      print('Raiting cant up ${e.toString()}');
    }
  }

  //Voute App
  Future<void> vouteDownRaiting(String ?id, int raiting, email)async{
    try{
      final current_article = await articles_references.doc(id);
      current_article.update({
        'raiting':
        FieldValue.arrayRemove([
          email
        ])
      });
      print('execute command');
    }
    catch(e){
      print('Raiting cant up');
    }
  }

}
