import 'package:adli_train/scenes/Extensions/colorExtension.dart';
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
  State createState() => _market_();
}

class _market_ extends State<_market> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    var listView = ListView(
      children: <Widget>[
        marketItems().categoryItem("Featured"),
        marketItems().categoryItem("Shoes"),
        marketItems().items(),
        marketItems().items(),
        marketItems().items(),
        marketItems().items(),
        marketItems().categoryItem("Etc"),
        marketItems().items(),
        marketItems().items(),
        marketItems().items(),
        marketItems().items()
      ],
    );

    var sliverWidget = CustomScrollView(
      slivers: <Widget>[
        SliverPersistentHeader(
          delegate: marketSliverHeader(),
          pinned: true,
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            if (index == 0 && index % 5 == 0) {
              return ListTile(
                contentPadding: EdgeInsets.all(0),
                title: marketHoriItems().items(),
              );
            }

            if (index == 1) {
              return ListTile(
                title: marketStatusProfile().container(),
              );
            }

            if (index == 2) {
              return ListTile(
                title: marketDiscountFeatured().container(),
              );
            }

            if (index == 3) {
              return ListTile(
                title: marketItems().categoryItem("Featured"),
              );
            }

            return ListTile(
              title: marketItems().items(),
            );
          }, 
          childCount: 15,),
        )
      ],
    );

    return Scaffold(
        backgroundColor: Colors.black.withOpacity(0.04),
        resizeToAvoidBottomInset: false,
        body: Container(
          padding: EdgeInsets.all(0),
            child: SafeArea(
          child: sliverWidget,
        )));
  }
}
