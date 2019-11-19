

import 'dart:ui';

import 'package:flutter/cupertino.dart';

class colorExtension {
  
  var purpleCommonLeftColor = Color(0xff4e54c8);
  var purpleCommonRightColor = Color(0xff8f94fb);

  var myColor = <Color>[Color(0xff4e54c8), Color(0xff8f94fb)];
  var flatPrimaryColor = <Color>[Color(0xff4ca1af), Color(0xff734b6d).withOpacity(0)];
  var flatWhiteColor = <Color>[Color(0xff8f94fb), Color(0xffffffff)];

  var blueSky = Color(0xff4ca1af);
  
  final Shader linearGradient = LinearGradient(
    colors: <Color>[Color(0xff4e54c8), Color(0xff8f94fb)],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  LinearGradient purpleGradient () {
    return LinearGradient(
      colors: myColor,
      begin: const FractionalOffset(1.0, 4.0),
      end: const FractionalOffset(0.0, 5.0),
      stops: [0.0,1.0],
      tileMode: TileMode.clamp
    );
  }

  LinearGradient whiteGradient () {
    return LinearGradient(
      colors: flatWhiteColor,
      begin: const FractionalOffset(2.0, 8.0),
      end: const FractionalOffset(2.0, 0.0),
      stops: [0.0,1.0],
      tileMode: TileMode.clamp
    );
  }

  LinearGradient flatPurpleGradient () {
    return LinearGradient(
      colors: flatPrimaryColor,
      begin: const FractionalOffset(1.0, 0.0),
      end: const FractionalOffset(1.0, 1.0),
      stops: [0.0,1.0],
      tileMode: TileMode.clamp
    );
  }
  
}