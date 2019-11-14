

import 'package:flutter/foundation.dart';

class postModel {
  
  final int userId;
  final int id ;
  final String title;
  final String body;

  postModel({
    this.userId,
    this.id,
    this.title,
    this.body
  });

  factory postModel.fromJson( Map<String,dynamic> json) {
    return postModel(
      userId: json['userID'],
      id: json['id'],
      title: json['title'],
      body: json['body']
    );
  }
}