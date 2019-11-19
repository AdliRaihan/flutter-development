


import 'dart:async';

import 'package:adli_train/scenes/Extensions/colorExtension.dart';
import 'package:flutter/material.dart';


class dashboardWidget_Container extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
    Container(
      height: 100,
        decoration: BoxDecoration(
        gradient: colorExtension().purpleGradient()
      ),
    );
  }
}

class dashboardWidget_CenterPositioned extends StatelessWidget {

  BuildContext _context;
  
  @override
  Widget build(BuildContext context) {
    this._context = context;
    return Positioned(
      child: Center(
        child: _container()
      ),
    );
  }


  Widget _container () {
    return Container(
        padding: EdgeInsets.only(
          left: 10,
          right: 10,
          top: 10,
          bottom: 0,
        ),
        margin: EdgeInsets.only(top: 30),
        height: 130,
        width:  MediaQuery.of(_context).size.width / 1.25,

        decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(5)),
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
          _columnWidgets(),
          _dashboardWidget_CenterPositioned()
        ],
      ),
    );
  }

  Widget _columnWidgets () {
    return Row(
      children: <Widget>[
        Expanded(
          child: _createLabelAndSubLabel("Lorem", "Lorem Ipsum"),
        ),

        Expanded(
          child: _createLabelAndSubLabel("Ipsum", "Lorem Ipsum"),
        ),

        Expanded(
          child: _createLabelAndSubLabel("Lore", "Lorem Ipsum"),
        )
      ]
    );
  }

  Column _createLabelAndSubLabel (String main,String desc) {
    return Column(
      children: <Widget>[
        _buildTextGill(
          main,14,colorExtension().purpleCommonLeftColor
        ),
        _buildTextGill(desc, 10, Colors.black54)
      ],
    );
  }

  Text _buildTextGill (String text,double fz,Color color) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: fz,
        color: color
      ),
    );
  }


}

class _dashboardWidget_CenterPositioned extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _dashboardWidget_CenterPositioned_();
}

class _dashboardWidget_CenterPositioned_ extends State<_dashboardWidget_CenterPositioned> {

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child : _containerItem()
        ),
        Expanded(
          child : _containerItem()
        ),
        Expanded(
          child : _containerItem()
        )
      ],
    );
  }

  Widget _containerItem () {
    return Container(
        width: 80,
        height: 60,
        padding: EdgeInsets.only(
          top: 7.5,
          left: 0,
          bottom: 0,
          right: 0
        ),
        margin: EdgeInsets.only(top: 15,left: 5),
        child: _buildItem(),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black12.withOpacity(0.03),
                blurRadius: 5,
                spreadRadius: 1
              )
            ]
          ),
      );
  }

  Column _buildItem () {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 5),
          height: 25,
          alignment: Alignment.center,
          child: Image.asset('assets/images/ic_blue_plus.png'),
        ),
        Container(
          padding: EdgeInsets.only(left: 10,right: 10,bottom: 5),
          alignment: Alignment.center,
          child: Text(
            'Lorem Ipsum',
            style: TextStyle(
              fontSize: 9
            ),
          )
        ),
      ],
    );
  }
}

class dashboardWidget_middle extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      padding: EdgeInsets.only(top: 20,bottom: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _createTitle("Lorem Ipsum"),
          _buildTicket()
        ],
      ),
    );
  }

  Container _createTitle (String text) {
    var _text = Text(
      text,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600
      ),
    );  

    return Container(
      padding: EdgeInsets.only(left: 20,right: 20),
      child: _text,
    );
  }

  Expanded _buildTicket () {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(top: 10),
        child: ListView(
          padding: EdgeInsets.only(left:20),
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            _ticketItems(selected: true),
            _ticketItems(),
            _ticketItems(),
            _ticketItems(),
            _ticketItems(),
            _ticketItems(),
            _ticketItems(),
            _ticketItems(),
            _ticketItems(),
            _ticketItems(),
          ],
        ),
      ),
    );
  }

  Container _ticketItems ({bool selected = false}) {
    return Container(

      margin: EdgeInsets.only(left: 0,right: 10,bottom: 5,top: 5),
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(2)),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.05),
            blurRadius: 5,
            spreadRadius: 1
          ),
        ],
        gradient: (selected) ? null : colorExtension().whiteGradient(),
        color: (selected) ? colorExtension().purpleCommonRightColor : Colors.white
      ),

      child: Center(
        child: Container(
          margin: EdgeInsets.only(top: 15),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Image.asset("assets/images/ic_blue_receipt.png"),
              ),
              Expanded(
                child: Text(
                  'Lorem Ipsum',
                  style: TextStyle(
                    color: (selected) ? Colors.white : Colors.black54,
                    fontSize: 12
                  ),
                ),
              )
            ],
          ),
        ),
      ),


    );
  }



}

class dashboardWidget_vertical extends StatelessWidget  {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5,left: 20,right: 20),
      height: 50,
      child: _content(),
    );
  }

  Widget _content () {
    return Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(right: 10),
          padding: EdgeInsets.all(5),
          width: 20,
          child: Container(
            decoration: BoxDecoration(
              color: colorExtension().purpleCommonRightColor,
              shape: BoxShape.circle
            ),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Title',
                style: TextStyle(
                  fontFamily: 'Gill Sans',
                  fontWeight: FontWeight.bold
                ),
              ),
              Text(
                'Description',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.black54
                ),
              )
            ],
          )
        ),
        Expanded(
          child: Text(
            '\$999.99',
            textAlign: TextAlign.end,
            style: TextStyle(
              color: Colors.green,
              fontFamily: 'Gill Sans'
            ),
          ),
        )  
      ],
    );
  }
}


class dashboardWidgetExpandable extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _dashboardWidgetExpandable();
  }
}

class _dashboardWidgetExpandable extends State<dashboardWidgetExpandable> with SingleTickerProviderStateMixin {

  bool state = false;


  @override
  Widget build(BuildContext context) {
    
    // TODO: implement build
    return AnimatedContainer(
      duration: Duration(milliseconds: 1500),
      height: (state) ? 50 : 150,
      color: Colors.white,
      curve: Curves.bounceOut,
      child: InkWell(
        onTap: () {
          setState(() {
            state = !state;
          });
        },

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            test(),
            test2()
          ],
        ),

      ),
    );
  }

Widget test () {
  return AnimatedOpacity(
    duration: Duration(seconds: 1),
    opacity: 1,

    child: Container(
      height: 50,
      child: Container(
        padding: EdgeInsets.only(left: 25,right: 25),
        alignment: Alignment.centerLeft,
        child: Text(
          'Expandable Section',
          textAlign: TextAlign.left,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black54
          ),
        ),
      ),
    ),
  );
}

Widget test2 () {
  String text = '''Lorem Ipsum is simply dummy text of the printing and typesetting industry.
  Lorem Ipsum is simply dummy text of the printing and typesetting industry
  Lorem Ipsum is simply dummy text of the printing and typesetting industry
  Lorem Ipsum is simply dummy text of the printing and typesetting industry
  Lorem Ipsum is simply dummy text of the printing and typesetting industry
  Lorem Ipsum is simply dummy text of the printing and typesetting industry
  Lorem Ipsum is simply dummy text of the printing and typesetting industry
  Lorem Ipsum is simply dummy text of the printing and typesetting industry''';
  return Expanded(
    child: Container(
      padding: EdgeInsets.only(left: 25,right: 25,top: 0,bottom: 10),
      height: 50,
      child: Text(
        text,
        maxLines: 5,
        overflow: TextOverflow.ellipsis,
      ),
    ),
  );
}



}