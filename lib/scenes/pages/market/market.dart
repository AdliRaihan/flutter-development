

import 'package:adli_train/scenes/pages/market/marketComponents.dart';
import 'package:flutter/material.dart';

class market extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: _market(),
    );
  }
}

class _market extends StatefulWidget {
  @override
  State createState () => _market_();
}

class _market_ extends State<_market> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.04),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            marketHeader().content(),
            marketItems().categoryItem("Featured"),
            marketHoriItems().items(),
            marketItems().categoryItem("Shoes"),
            marketItems().items(),
            marketItems().items(),
            marketItems().items(),
            marketItems().items(),
            marketItems().categoryItem("E.t.c"),
            marketItems().items(),
            marketItems().items(),
            marketItems().items(),
            marketItems().items()
          ],
        )
      )
    ); 
  }
}