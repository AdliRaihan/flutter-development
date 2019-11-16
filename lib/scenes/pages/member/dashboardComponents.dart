

import 'package:adli_train/common/Models/Account/registerModel.dart';
import 'package:adli_train/scenes/Extensions/colorExtension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class dashboardComponents extends StatelessWidget {

  final List<Widget> listWidget;
  final Size size;

  dashboardComponents({
    this.listWidget,
    @required this.size
  });


  @override
  Widget build(BuildContext context) {

    final heights = size.height * 0.165;
    final screenWidth = size.width;
    // TODO: implement build
    return Container(
      height: heights,
      child: Column(
        children: <Widget>[
          Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              Positioned(
                child: Container(
                  height: 100,
                  width: screenWidth,
                  decoration: BoxDecoration(
                    color: colorExtension().purpleCommonRightColor
                  ),
                ),
              ),
              Positioned(
                top: screenWidth * 0.07,
                left: screenWidth * 0.05,
                child: Text(
                  "Welcome back , Adli",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                  ),
                ),
              ),
              Positioned(
                top: screenWidth * 0.1,
                child: Container(
                  height: 100,
                  width: screenWidth,
                  padding: EdgeInsets.only(top:20,bottom: 10),
                  child: ListView(
                    padding: EdgeInsets.all(5),
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      _listViewItem(gradient: true),
                      _listViewItem(),
                      _listViewItem(),
                      _listViewItem(),
                      _listViewItem(),
                      _listViewItem(),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Container _listViewItem ({bool gradient = false}) {
    return Container(
      margin: EdgeInsets.only(left:2.5,right:2.5),
      height: 100,
      width: 150,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        gradient: gradient ? colorExtension().purpleGradient() : null ,
        color: gradient ? null : Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(5)),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 2,
            blurRadius: 1
          )
        ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            "Finish Mission #1",
            style: TextStyle(
              color:  gradient ? Colors.white : Colors.black54,
              fontWeight: FontWeight.bold,
              fontSize: 14
            ),
          ),
          Expanded(
            child: Text(
              'You get 40% discount for all items',
              style: TextStyle(
                fontSize: 10,
                color: gradient ? Colors.white : Colors.black54
              ),
            ),
          )
        ],
      ),
    );
  }

}

class dashboardMiddleComponents extends StatelessWidget {

  Size size;
  dashboardMiddleComponents ({
    this.size
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 140,
      padding: EdgeInsets.all(10),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            left: BorderSide(
              color: colorExtension().myColor.last,
              width: 5
            )
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              spreadRadius: 1
            )
          ]
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    'Ads Revenue',
                    style: TextStyle(
                      color: Colors.black12,
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                    ),
                  ),
                   _columnItems()
                ],
              )
            ),
            buttonWithdraw()
          ],
        ),
      ),
    );
  }

  Row _columnItems () {
    return  Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 15,bottom: 5),
          child: Row(
            children: <Widget>[
              Text(
                '\$81,992',
                style: TextStyle(
                  foreground: Paint()..shader = colorExtension().linearGradient,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto'
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10,right: 0,bottom: 0,top: 10),
                child: Text(
                  '+ \$80,000',
                  style: TextStyle(
                    color: Colors.green
                  )
                )
              )
            ],
          ),
        ),
      ],
    );
  }

  Expanded buttonWithdraw () {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          gradient: colorExtension().purpleGradient(),
          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 1,
              blurRadius: 5
            )
          ]
        ),
        child: GestureDetector(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 10),
                margin: EdgeInsets.only(bottom: 2.5),
                height: 50,
                child: Image.asset("assets/images/ic_blue_receipt.png"),
              ),
              Text(
                'Withdraw Money',
                style: TextStyle(
                  color: Colors.white70
                ),
              )
            ],
          ),
        ),
      )
    );
  }
  
}

class dashboardMiddleBottomContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 5,
            blurRadius: 5
          )
        ]
      ),
      child: Text('12 Hours Learning Flutter . \n Lebih cepet dibanding ios native sih \n bikin gini , kurang lebih 30 menit , kalau native bisa berjam2 kayanya\n\n yg pusing adalah bahasanya'),
    );
  }
}