import 'package:adli_train/common/Models/Account/registerModel.dart';
import 'package:adli_train/common/Variable/constant.dart';
import 'package:adli_train/scenes/Extensions/colorExtension.dart';
import 'package:adli_train/scenes/Extensions/globalExtensions.dart';
import 'package:adli_train/scenes/pages/Account/pin/pin.dart';
import 'package:adli_train/scenes/pages/member/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

void main() { runApp(new register()); }


class register extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _registerState(),
    );
  }
}

class _registerState extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _registerStateHolder();
}

class _registerStateHolder extends State<_registerState>{




  registerModel rModel = registerModel();
  final newKey = GlobalKey<FormState>();


  // Create Focus Node
  final FocusNode fnUsername = FocusNode();
  final FocusNode fnEmail = FocusNode();
  final FocusNode fnPassword = FocusNode();
  final FocusNode fnConfPassword = FocusNode();
  final FocusNode fnHandphone = FocusNode();

  String password;
  String confpassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: colorExtension().purpleCommonRightColor,
        title: Container(
          padding: EdgeInsets.only(top: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "SIGN UP",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
              Text(
                'Dashboard > Create New Account',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.w300
                ),
              )   
            ],
          ),
        ),
      ),
      body: _container(),
    );
  }

  Widget _container() {
    return SafeArea(
      child: Container(
        color: Colors.black12.withOpacity(0.01),
        child: Column(
          children: <Widget>[
            _createForms()
          ],
        )
      ),
    );
  }

  Widget _createForms () {

    return Expanded(
      child: Scrollable(
        viewportBuilder: (BuildContext context, ViewportOffset position) {
          return ListView(
            children: <Widget>[
              Form(
                child: _createFormWidget(),
              )  
            ],
          );
        },
      ),
    );
  }


  Widget _createFormWidget () {
    return Form(
      key: newKey,
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            _createEachWidget("Username",index: 0),
            _createEachWidget("Email",index: 1),
            _createEachWidget("Password",index: 2),
            _createEachWidget("Confirm Pasword",index: 3),
            _createEachWidget("Handphone",index: 4),
            _createButtonSubmit(),
            _createLoginRouter()
          ],
        ),
      ),
    );
  }

  Widget _createLoginRouter () {
    return Container(
      margin: EdgeInsets.only(top:20),
      padding: EdgeInsets.all(10),
      
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Text(
              'Already have account?',
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Colors.black45,
                fontFamily: 'Gill Sans'
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10),
            child: GestureDetector(
              onTap: () {
                print("Menu Belum tersedia");
              },
              child: Text(
                'Sign In',
                style: TextStyle(
                  color: Colors.black54,
                  decoration: TextDecoration.underline,
                  fontFamily: 'Gill Sans'
                ),  
              ),
            )
          ),
        ],
      ),
    );
  }


  Widget _createButtonSubmit () {
    Row content = Row(
      children: <Widget>[
        Expanded(
          child: FlatButton(
            padding: EdgeInsets.only(top: 15,bottom: 15),
            child: Text(
              'sign up'.toUpperCase(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w100
              ),
            ),
            color: colorExtension().purpleCommonRightColor,
            textTheme: ButtonTextTheme.normal,
            onPressed: () {
              if (this.newKey.currentState.validate()) {
                Route route = MaterialPageRoute(builder: (context) => pin());
                Navigator.pushAndRemoveUntil(context, route, (Route<dynamic> route) => false);
              }
            },
            shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(0))
            ),
          ),
        )
      ],
    );

    return Container(
      padding: EdgeInsets.only(
        left: 20,
        right: 20
      ),
      margin: EdgeInsets.only(top: 50),
      child: content,
    );
  }

  Widget _createEachWidget (String labelText, {int index = -1}) {
    final List<FocusNode> fnArray = [fnUsername,fnEmail,fnPassword,fnConfPassword,fnHandphone];
    final FocusNode focusNode = fnArray[index];

    print(focusNode);
    print((index == 2 || index == 3));

    TextFormField tf = TextFormField(
      style: TextStyle (
        fontWeight: FontWeight.bold,
        color: Colors.black.withOpacity(0.7)
      ),
      focusNode: (index == -1) ? null : focusNode,
      onFieldSubmitted: (term) {
        focusNode.unfocus();

        if (index + 1 < fnArray.length)
          FocusScope.of(context).requestFocus(fnArray[index + 1]);

      },
      obscureText: (index == 2 || index == 3),
      keyboardType: (index == 2 || index == 3) ? TextInputType.visiblePassword : TextInputType.text,
      onChanged: (value) {
        if (index == 2) {
          password = value;
        } else if (index == 3) {
          confpassword = value;
        }
      },
      validator: (value){
        if (value.isEmpty) {
          return "Field cannot blank";
        }
        if (index == 2 || index == 3) 
          if (password != confpassword) {
            return "Passwor didn't match!";
          }
        
        return null;
      },
      textInputAction: TextInputAction.done,
      scrollPadding: EdgeInsets.all(20),
      decoration: InputDecoration(
        alignLabelWithHint: true,
        labelText: labelText,
        labelStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Colors.black.withOpacity(0.3)
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black.withOpacity(0.1),
            width: 1.5
          )
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black.withOpacity(0.2),
            width: 1.5
          )
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 5,
            color: Colors.red,
          ),
        )
      ),
    );

    return Container(
      padding: EdgeInsets.only(
        top: 20,
        left: 20,
        right: 20
      ),
      child: tf,
    );
  }

}

