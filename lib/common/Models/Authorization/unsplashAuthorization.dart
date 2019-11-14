
import 'dart:convert';

import 'package:adli_train/common/Models/Authorization/unsplashGrantAuthModel.dart';
import 'package:http/http.dart' as http;

class unsplashAuthorizationModel {


  String url = "https://unsplash.com/oauth/token";

  final String clientId;
  final String clientSecret;
  final String redirectURL;
  final String code = "6bbe37467a7f08796b6ed0d2c3b99d9cd5ed04a3ec188a3d8d66fb29a9f5df96";
  final String grantType = "authorization_code";


  unsplashAuthorizationModel({
    this.clientId,
    this.clientSecret,
    this.redirectURL,
  });


  factory unsplashAuthorizationModel.parseJson (Map<String,dynamic> json) {
    return unsplashAuthorizationModel(
      clientId: json["client_id"],
      redirectURL: json["redirect_uri"],
    );
  }

  Map toMap () {
    var map = new Map<String,dynamic>();

    print ("$clientId $clientSecret , $redirectURL , $code , $grantType");
    map["client_id"] = "$clientId";
    map["client_secret"] = "$clientSecret";
    map["redirect_uri"] = "$redirectURL";
    map["code"] = "$code";
    map["grant_type"] = "$grantType";
    print(map);
    return map;
  }

  Future<unsplashGrantAuthModel> createPost (String url , {Map body}) async {
    return http.post(this.url,body: body).then((http.Response response) {

      if (response.statusCode == 200) {
        return unsplashGrantAuthModel.fromJson(json.decode(response.body));
      } else {
        return unsplashGrantAuthModel.fromJsonError(json.decode(response.body));
      }
    });
  }

}
