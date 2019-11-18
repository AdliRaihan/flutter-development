

import 'package:adli_train/scenes/pages/member/dashboardComponents.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class dashboard extends StatelessWidget {

@override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: _dashboard(),
    );
  }

}


class _dashboard extends StatelessWidget {

@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
          ],
        ),
      ),
    );
  }
}