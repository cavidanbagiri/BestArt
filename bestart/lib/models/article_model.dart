

import 'package:cloud_firestore/cloud_firestore.dart';

class ArticleModel {
  String ? id;
  String ? title;
  String ? subject;
  List ? raiting;
  String ? email;
  List ? comments;

  ArticleModel(this.id, this.title, this.subject, this.raiting, this.email, this.comments);

  //Read data contructor
  ArticleModel.readData(DocumentSnapshot snapshot){
    id = snapshot.id;
    title = snapshot['title'];
    subject = snapshot['subject'];
    email = snapshot['email'];
    raiting = snapshot['raiting'];
    comments = snapshot['comments'];
  }

}