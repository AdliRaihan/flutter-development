
import 'package:adli_train/scenes/Extensions/colorExtension.dart';
import 'package:adli_train/scenes/pages/login/login.dart';
import 'package:adli_train/scenes/pages/member/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;

class pin extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    
    return MaterialApp(
      home: _pin(),
    );
  }
}

class _pin extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return __pin();
  }
}

class __pin extends State<_pin> {

  double size;

  String valuePin1 = "";
  String valuePin2 = "";
  String valuePin3 = "";
  String valuePin4 = "";

  String concatePin = "";
  String confrimPin = "";

  bool error = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    
    return Scaffold(

      body: SafeArea(
        child: _container(),
      ),

    );
  }

  Widget _container() {
    
    size = MediaQuery.of(context).size.width;
    size = (size / 3) - 75;

    Container content = Container(
      child: Column(
        children: <Widget>[
          Expanded(
            child: _topExpandedContent()
          ),
          Expanded (
            child: _bottomExpandedContent(),
          )
        ],
      ),
    );
    return Form(
      child: content,
    );
  }


  Widget _topExpandedContent () {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Text(
                      "LOREM",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 24,
                        color: colorExtension().purpleCommonRightColor,
                        fontFamily: "gill sans",
                        fontWeight: FontWeight.bold
                      )
                    )
                  ),


                  Container(
                    child: Text(
                      "Thanks for joining our community ",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 14,
                        color: colorExtension().purpleCommonRightColor,
                        fontFamily: "gill sans",
                        fontWeight: FontWeight.w300
                      )
                    )
                  ),

                  Container(
                    padding: EdgeInsets.only(top: 15),
                    child: _buildText()
                  ),

                ],
              ),
              decoration: BoxDecoration(
                
              ),
            ),
          ),
          Expanded(
            child: _topExpandedContentBottom()
          )
        ],
      ),
    );
  }


  Text _buildText () {
    if (!error) {
      return Text(
      "Before you continue to using our application , please setup your PIN first !",
      textAlign: TextAlign.left,
        style: TextStyle(
          fontSize: 12,
          color: colorExtension().purpleCommonRightColor,
          fontFamily: "gill sans",
        )
      );                                                                         
    } else {
      return Text(
      "Your first PIN and second PIN does not match!",
      textAlign: TextAlign.left,
        style: TextStyle(
          fontSize: 12,
          color: Colors.red,
          fontFamily: "gill sans",
        )
      );   
    }
  }

  Widget _topExpandedContentBottom () {
    return SafeArea(
      child: Container(

        margin: EdgeInsets.only(left: 30 ,right: 30,top: 20,bottom: 0),
        child: Column(
          children: <Widget>[
            Container(
              child: Text(
                (concatePin.isEmpty) ? "Create New PIN" : "Confrim PIN",
                style: TextStyle(
                  foreground: Paint()..shader = colorExtension().linearGradient,
                  fontWeight: FontWeight.bold,
                  fontSize: 18
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                valuePin(valuePin1),
                valuePin(valuePin2),
                valuePin(valuePin3),
                valuePin(valuePin4),
              ],
            ),
          ],
        )
      ),
    );
  }

  Widget _bottomExpandedContent () {
    return Container(
      margin: EdgeInsets.only(
        left: 75,
        right: 75
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Column(
              children: <Widget>[

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    getNumpad("1"),
                    getNumpad("2"),
                    getNumpad("3"),
                  ],
                ),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    getNumpad("4"),
                    getNumpad("5"),
                    getNumpad("6"),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    getNumpad("7"),
                    getNumpad("8"),
                    getNumpad("9"),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    getNumpad(""),
                    getNumpad("0"),
                    getNumpad("D"),
                  ],
                ),

                

              ],
            ), 
          )
        ],
      ),
    );
  }


  Widget getNumpad (String Number) {
    Container pad = Container(
      margin: EdgeInsets.all(5),
      width: size, 
      height: size,
      padding: EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.05),
        borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      child: Text(
        Number,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          foreground: Paint()..shader = colorExtension().linearGradient
        ),
      ),
    );

    return GestureDetector(
      onTap: () {
        setState(() {
          if (Number == "D") {
            deleteDigit();
          } else if (Number != "") {
            addDigit(Number);
          }

        });
      },
      child: pad,
    );
  }

  void addDigit (String number) {
    setState(() {
      if (valuePin1.isEmpty) {
        valuePin1 = number;
      } else if (valuePin2.isEmpty) {
        valuePin2 = number;
      } else if (valuePin3.isEmpty ) {
        valuePin3 = number;
      } else {
        valuePin4 = number;
      }

      if (valuePin1.isNotEmpty && valuePin2.isNotEmpty && valuePin3.isNotEmpty && valuePin4.isNotEmpty){
        if (concatePin.isEmpty) {
          concatePin = "$valuePin1$valuePin2$valuePin3$valuePin4";
          resetDigit();
        } else {
          confrimPin = "$valuePin1$valuePin2$valuePin3$valuePin4";

          if(concatePin != confrimPin) {
            error = true;
          } else {
            error = false;
            showDialog_();
          }


          concatePin = "";
          confrimPin = "";
          resetDigit();

        }
       } 

    });
  }

  void showDialog_() {
    showDialog(
      context:  context,
      barrierDismissible: true,
      builder: (context) {
        new Future.delayed(new Duration(seconds: 2), () {
          Navigator.of(context).pop();
          Route router = MaterialPageRoute(builder: (context) => dashboard());
          Navigator.of(context).pushAndRemoveUntil(router, (Route<dynamic> router ) => false);
        });
        return Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(20),
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                  backgroundColor: Colors.transparent
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  gradient: colorExtension().purpleGradient(),
                  borderRadius: BorderRadius.all(Radius.circular(20))
                ),
              )
            ],
          ),
        );
      }
    );

  }

  void deleteDigit () {
    setState(() {
      if (valuePin1.isNotEmpty && valuePin2.isEmpty && valuePin3.isEmpty && valuePin4.isEmpty) {
        valuePin1 = "";
      } else if (valuePin2.isNotEmpty && valuePin3.isEmpty && valuePin4.isEmpty) {
        valuePin2 = "";
      } else if (valuePin3.isNotEmpty && valuePin4.isEmpty) {
        valuePin3 = "";
      } else {
        valuePin4 = "";
      }
    });
  }

  void resetDigit () {
    setState(() {
        valuePin1 = "";
        valuePin2 = "";
        valuePin3 = "";
        valuePin4 = "";
    });
  }

  Widget valuePin(String value) {
    return Container(
      margin: EdgeInsets.only(left: 5,right: 5,top: 20),
      width: 35,
      child: Column(
        children: <Widget>[
          Container(
            width: 10,
            height: 10,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: (value.isNotEmpty) ?  colorExtension().purpleCommonRightColor : null,
              shape: BoxShape.circle
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black12
              )
            ),
          )
        ],
      ),
    );
  }

}


