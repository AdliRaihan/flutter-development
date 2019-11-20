import 'package:adli_train/scenes/Extensions/colorExtension.dart';
import 'package:flutter/material.dart';

class marketContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container();
  }
}

class marketHeader {
  marketHeader();

  var clearTextField = TextField(
    style: TextStyle(color: Colors.white, fontSize: 12),
    cursorColor: colorExtension().purpleCommonLeftColor,
    decoration: InputDecoration(
      hintText: "iPhone 11 Pro : iOS Software Build 13.1...",
      hintStyle: TextStyle(color: Colors.white70, fontSize: 12),
      contentPadding: EdgeInsets.only(top: 0, left: 10, bottom: 0),
      fillColor: Colors.white,
      focusColor: Colors.white,
      hoverColor: Colors.white,
      enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent, width: 0)),
      focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent, width: 0)),
    ),
  );

  Widget content() {
    return Container(
      alignment: Alignment.center,
      height: 150,
      decoration: BoxDecoration(
        gradient: colorExtension().purpleGradient(),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          defaultText(),
          defaultTextDesc(),
          defaultContainer(child: clearTextField)
        ],
      ),
    );
  }

  Widget defaultText() {
    return Container(

        padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 0),
        margin: EdgeInsets.only(left: 15, right: 15),
        child: Text(
          'Marketplace',
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: 'Gill Sans'
          ),
    ));

  }

  Widget defaultTextDesc () {
    return Container(

        padding: EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 15),
        margin: EdgeInsets.only(left: 15, right: 15),
        child: Text(
          'Lorem ipsum taradam tiridim turudum turedum , Lorem ipsum taradam tiridim turudum turedum ',
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w100,
            color: Colors.white60
          ),
    ));
  }

  Widget defaultContainer({Widget child}) {
    return Container(
        height: 35,
        padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
        margin: EdgeInsets.only(left: 25, right: 25),
        decoration: BoxDecoration(
            color: Colors.white24,
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Container(
            child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 25,
              child: Icon(Icons.search, color: Colors.white70),
            ),
            Expanded(child: child ?? Container())
          ],
        )));
  }
}

class marketItems {
  marketItems();

  Widget items() {
    return Container(
      height: 60,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Image.asset('assets/images/ic_blue_shoes.png'),
          Container(
            padding: EdgeInsets.all(5),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                    child: Text(
                  'Shoes',
                  style: TextStyle(
                      fontFamily: 'Gill Sans',
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54
                  )
                )),
                Container(
                    child: Text(
                  '69 New Item\'s',
                  style: TextStyle(color: Colors.black45, fontSize: 10),
                )),
              ],
            ),
          ),
          Container(
              width: 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Avg. Price \$99.25',
                    style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  ),
                  Text(
                    '600+ Items available',
                    style: TextStyle(color: Colors.black38, fontSize: 10),
                  )
                ],
              ))
        ],
      ),
    );
  }

  Widget categoryItem (String title) {
    return Container(
      padding: EdgeInsets.only(left:20,right:20,top:15,bottom: 5),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black54,
          fontFamily: 'Gill Sans'
        ),
      ),
    );
  }
}

class marketHoriItems {

  Widget items () {
    return Container(
      alignment: Alignment.center,
      height: 70,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          _cellItems(),
          _cellItems(),
          _cellItems(),
          _cellItems(),
          _cellItems(),
          _cellItems(),
        ],
      ),
    );
  }

  Widget _cellItems () {
    return Container(
      width: 250,
      padding: EdgeInsets.only(left:10,right:15),
      child: Container(
        margin: EdgeInsets.only(top: 10,bottom: 10),
        padding: EdgeInsets.only(left: 15,right: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(left: BorderSide(
            color: Colors.redAccent,
            width: 5,
          )),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 5,
              spreadRadius: 1
            )
          ]
        ),
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 10),
              width: 35,
              child: Image.asset("assets/images/ic_blue_shoes.png"),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Shoes Fire Abcdef",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12
                  ),
                ),
                Text(
                  "Monthly Payment",
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.black54
                  ),
                ),
                
              ],
            )
          ],
        ),
      ),
    );
  }
}