


import 'package:adli_train/common/Variable/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class unsplashGrantAuthModel {

  final String accessToken;
  final String tokenType;
  final String refreshToken ;
  final String scope;

  final String error;
  final String errorDescription;
  final String statusCode;

  unsplashGrantAuthModel ({
    this.accessToken,
    this.tokenType,
    this.refreshToken,
    this.scope,
    this.error,
    this.errorDescription,
    this.statusCode
  });


  factory unsplashGrantAuthModel.fromJson (Map<String,dynamic> map) {
    return unsplashGrantAuthModel(
      accessToken: map['access_token'],
      tokenType : map["token_type"],
      refreshToken : map["refresh_token"],
      scope : map["scope"]
    );
  }

  factory unsplashGrantAuthModel.fromJsonError(Map<String,dynamic> map) {
    return unsplashGrantAuthModel(
      error: map['error'],
      errorDescription: map['error_description']
    );
  }

  Future<String> setAccessKey (String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(constant().tokenAccessKey, value);
  }

}