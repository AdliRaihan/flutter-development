import 'dart:convert';
import 'dart:ffi';

import 'package:adli_train/common/Models/Account/registerModel.dart';
import 'package:adli_train/common/Models/postModel.dart';
import 'package:adli_train/common/Services/apiManager.dart';
import 'package:adli_train/common/Variable/constant.dart';
import 'package:adli_train/scenes/pages/Account/register/register.dart';
import 'package:adli_train/scenes/pages/Account/register/register.dart' as prefix0;
import 'package:adli_train/scenes/pages/login/login.dart';
import 'package:adli_train/scenes/pages/member/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'common/Models/Authorization/unsplashAuthorization.dart';

void main() => runApp(MyApp());


enum state {
  min , plus
}


class MyApp extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.black,
      statusBarBrightness: Brightness.light
    ));

    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown
      ]
    );

    return MaterialApp(
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red)
          ),
          fillColor: Colors.red
        )
      ),
      home: launcScreen(),
    );
  }

}

class launcScreen extends StatefulWidget {


  @override
  State<StatefulWidget> createState() {
    return _launchScreen();
  }
}

class _launchScreen extends State<launcScreen> {

  @override
  void didUpdateWidget(launcScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => checkCredentials()
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
        ),
      ),
    );
  }

  void pushToLogin () {
    Route route = MaterialPageRoute(builder: (context) => Login());
    Navigator.pushAndRemoveUntil(context, route, (Route<dynamic> route) => false);
  }

  void pushToDashboard () {
    Route route = MaterialPageRoute(builder: (context) => dashboard());
    Navigator.pushAndRemoveUntil(context, route, (Route<dynamic> route) => false);
  }

  void checkCredentials () {
    registerModel rModel = registerModel();
    rModel.getUsername('').then(
      (value) {
        if (value.isEmpty) {
          pushToLogin();
        } else {
          pushToLogin();
          // pushToDashboard();
        }
      }
    );
  }
}