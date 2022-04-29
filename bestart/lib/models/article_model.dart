

import 'package:cloud_firestore/cloud_firestore.dart';

class ArticleModel {
  String ? id;
  String ? title;
  String ? subject;
  int raiting=0;
  String ? email;

  ArticleModel(this.id, this.title, this.subject, this.raiting, this.email);

  //Read data contructor
  ArticleModel.readData(DocumentSnapshot snapshot){
    id = snapshot.id;
    title = snapshot['title'];
    subject = snapshot['subject'];
    email = snapshot['email'];
  }

}