

import 'package:adli_train/scenes/Extensions/colorExtension.dart';
import 'package:adli_train/scenes/pages/member/dashboardComponents.dart';
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

@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Scrollable(
          viewportBuilder: (BuildContext context , ViewportOffset position) {
            return ListView(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      height: 100,
                      decoration: BoxDecoration(
                        gradient: colorExtension().purpleGradient()
                      ),
                    ),

                    Positioned(
                      child: Center(
                        child: Container(
                          padding: EdgeInsets.only(
                            left: 20,
                            right: 20,
                            top: 10,
                            bottom: 10,
                          ),
                          margin: EdgeInsets.only(top: 50),
                          height: 100,
                          width:  MediaQuery.of(context).size.width / 1.25,

                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                spreadRadius: 1,
                                blurRadius: 5
                              )
                            ]
                          ),

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Savings',
                                style: TextStyle(
                                  fontFamily: 'Gill Sans',
                                  fontSize: 24,
                                  color: colorExtension().purpleCommonRightColor
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            );
              
          },
        )
      )
    );
  }
}