


import 'dart:convert';
import 'package:adli_train/common/Models/postModel.dart';
import 'package:http/http.dart' as http;

class apiManager {
  
  Future<postModel> fetchPosts () async {
    
    // final response = await http.get("https://jsonplaceholder.typicode.com/posts/1");
    
    // print("Loading");
    // if (response.statusCode == 200) {
    //   print("Success");
    //   return postModel.fromJson(json.decode(response.body));
    // } else {
    //   print("Failed");
    //   throw Exception('Failed to load posts , check your connection!');
    // }

  }
}