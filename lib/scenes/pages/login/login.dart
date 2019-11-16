import 'dart:convert';
import 'dart:ffi';

import 'package:adli_train/common/Models/postModel.dart';
import 'package:adli_train/common/Services/apiManager.dart';
import 'package:adli_train/common/Variable/constant.dart';
import 'package:adli_train/scenes/pages/Account/register/register.dart';
import 'package:adli_train/scenes/pages/Account/register/register.dart' as prefix0;
import 'package:adli_train/scenes/pages/member/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(Login());


enum state {
  min , plus
}


class Login extends StatelessWidget {
  
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
      initialRoute: '/',
      routes: {
        '/register' : (context) => register(),
        '/dashboard' : (context) => dashboard(),
      },
      theme: ThemeData(
        backgroundColor: Colors.black,
        brightness: Brightness.light
      ),
      home: new myApplication()
    );
  }

}

class myApplication extends StatefulWidget {
  @override
  State createState() => myApp_();
}

class myApp_ extends State<myApplication> {


  final Shader linearGradient = LinearGradient(
    colors: <Color>[Color(0xff4e54c8), Color(0xff8f94fb)],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  Future<postModel> model;

  var myColor = <Color>[Color(0xff4e54c8), Color(0xff8f94fb)];

  @override
  void initState() {
    super.initState();
    model = apiManager().fetchPosts();
  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Container(
            height: size.width * 0.7,
            width: size.width * 0.8,

            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black12.withOpacity(0.01),
                  spreadRadius: 1,
                  blurRadius: 10
                )
              ]
            ),

            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(5))
              ),

              child: buildConstruct(),
            ),


          ),
        ),
      ),
    );
  }


  Widget buildConstruct () {

    /*
    final String url = "https://unsplash.com/oauth/token";
    final unsplashModel = unsplashAuthorizationModel(
      clientId: constant().accessKey,
      clientSecret: constant().secretKey,
      redirectURL: "urn:ietf:wg:oauth:2.0:oob",
     );
    final response = unsplashAuthorizationModel().createPost(url,body: unsplashModel.toMap());
    */

    return Column(
      children: <Widget>[

        // Title
        Center(
          child: Container(
            margin: EdgeInsets.only(
              bottom: 15
            ),
            child: Column(
              children: <Widget>[
                Container(
                  child: Text(
                    'Lorem',
                    style: 
                    TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      foreground: Paint()..shader = linearGradient,
                    ),
                  ),
                ),

                Container(
                  child: Text(
                    'All your demands is in this application',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.deepPurple.withOpacity(0.3),
                      fontSize: 12,
                      fontFamily: "Gill Sans"
                    ),
                  ),
                )
              ],
            ),
          ),
        ),

        // Body Login
        Expanded(
          child: Center(
            child: Column(
              children: <Widget>[
                FlatButton(
                  highlightColor: Colors.transparent,
                  colorBrightness: Brightness.light,
                  hoverColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  padding: EdgeInsets.all(0),
                  color: Colors.transparent,
                  splashColor: Colors.transparent,
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  child: Row(
                    
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: myColor,
                              begin: const FractionalOffset(1.0, 4.0),
                              end: const FractionalOffset(0.0, 5.0),
                              stops: [0.0,1.0],
                              tileMode: TileMode.clamp
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26.withOpacity(0.3),
                                spreadRadius: 1,
                                blurRadius: 2
                              )
                            ]
                          ),

                          padding: EdgeInsets.all(10),
                          child: Text(
                            'Create New Account',
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    ],
                  ),
                ),

                FlatButton(
                  highlightColor: Colors.transparent,
                  colorBrightness: Brightness.light,
                  hoverColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  padding: EdgeInsets.all(0),
                  color: Colors.transparent,
                  splashColor: Colors.transparent,

                  onPressed: () {
                    print("Route To Sign In!");
                  },

                  child: Text(
                    'Sign In',
                    style: TextStyle(
                      foreground: Paint()..shader = linearGradient,
                      fontWeight: FontWeight.bold,
                      fontSize: 14
                    ),
                  ),
                ) ,

                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    border: Border.all(width: .1)
                  ),
                ),

                Container(
                  child: Text(
                    'Or you lost your password ?',
                    style: TextStyle(
                      fontSize: 12
                    ),
                  )
                ),

                GestureDetector(
                  child: Container(
                    margin: EdgeInsets.only(top: 5),
                    child: Text(
                    'Forgot Password',
                    style: TextStyle(
                        foreground: Paint()..shader = linearGradient,
                        fontSize: 12
                      ),
                    ),
                  ),
                )
              ]
            ),
          ),
        ),

      ],
    );
  }

}