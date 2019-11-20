

import 'package:adli_train/scenes/Extensions/colorExtension.dart';
import 'package:adli_train/scenes/pages/member/dashboardComponents.dart';
import 'package:adli_train/scenes/pages/member/dashboardSubscriptionImpl.dart';
import 'package:adli_train/scenes/pages/member/dashboardWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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

  var textEditingController = TextEditingController();
  dashboardSubscriptionImpl _viewModel = dashboardSubscriptionImpl();
  BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    textEditingController.addListener(() => _viewModel.inputText.add(textEditingController.text));

    return Scaffold(
      body: SafeArea(
        child: Scrollable(
          viewportBuilder: (BuildContext context , ViewportOffset position) {
            return lvContent();
          },
        )
      )
    );
  }

  ListView lvContent() {
    return ListView(
      padding: EdgeInsets.only(bottom: 20),
      children: <Widget>[
        Stack(
          children: <Widget>[
            dashboardWidget_Container(),
            dashboardWidget_CenterPositioned()
          ],
        ),
        dashboardWidget_middle(),
        dashboardWidget_vertical(),
        dashboardWidgetExpandable(),
        dashboardWidgetExpandable(),
      ],
    );
  }
}