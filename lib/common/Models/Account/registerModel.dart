
import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class registerModel {

  
  String _kusername = "kUsername";
  String _kemail = "kEmail";
  String _kpassword = "kPassword";
  String _kconfirmPassword = "kConfirmPassword";

  String username;
  String email;
  String password;
  String confirmPassword;


  Future<registerModel> getInformation () async {

  }

  setInformation (registerModel value) async {
    setUsername(value.username);
  }

  setUsername (String value) async {
    final SharedPreferences prefs =  await SharedPreferences.getInstance();
    prefs.setString(_kusername, value);
  }

  Future<String> getUsername (String value) async {
    final SharedPreferences prefs =  await SharedPreferences.getInstance();
    return prefs.getString(_kusername) ?? "";
  }
  
  Future<String> setEmail (String value) async {
    final SharedPreferences prefs =  await SharedPreferences.getInstance();
    return prefs.setString(_kemail, value) ?? 'email';
  }
  
  Future<String> setPassword (String value) async {
    final SharedPreferences prefs =  await SharedPreferences.getInstance();
    return prefs.setString(_kpassword, value) ?? 'password';
  }


}