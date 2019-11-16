import 'package:adli_train/common/Models/Account/registerModel.dart';
import 'package:adli_train/scenes/Extensions/colorExtension.dart';
import 'package:adli_train/scenes/Extensions/globalExtensions.dart';
import 'package:adli_train/scenes/pages/member/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() { runApp(new register());}


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
  final username  = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final confpassword = TextEditingController();
  final _keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _container(),
    );
  }

  Widget _container() {
    return SafeArea(
      child: Container(
        child: Column(
          children: <Widget>[

            Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.centerLeft,
                  child: BackButton(
                    color: colorExtension().purpleCommonLeftColor,
                  ),
                ),
                Expanded(
                  child: Text(
                    'Register',
                    style: TextStyle(
                      foreground: Paint()..shader = colorExtension().linearGradient,
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                )
              ],
            ),

            _createForms()

          ],
        )
      ),
    );
  }

  Widget _createForms () {
    return Expanded(
      child: Center(
        child: Form(
          key: this._keyForm,
          child: SafeArea(
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(20),
              color: Colors.black87.withOpacity(0.1),
              child: _createElementForms() ,
            ),
          )
        ),
      ),
    );
  }


  Widget _createElementForms () {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _createLogo(),
        _costumTextfield()
      ],
    );
  }

  Widget _createLogo () {
    return Container (
      padding: EdgeInsets.all(20),  
      child: Text(
        "Restaurand".toUpperCase(),
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.black26
        ),
      ),
    );
  }


  Widget _costumTextfield () {
    return Container(
      child: Column(
        children: <Widget>[
          classificationTextField(
            hintText: "username",
            controller: username,
            inputType: TextInputType.text,
            value: (value) {
              rModel.username = value;
            },
          ),
          classificationTextField(
            hintText: "your@email.domain",
            controller: email,
            inputType: TextInputType.emailAddress,
            value: (value) {
              rModel.email = value;
            },
          ),
          classificationTextField(
            hintText: "Password",
            controller: password,
            inputType: TextInputType.visiblePassword,
            value: (value) {
              rModel.password = value;
            },
          ),
          classificationTextField(
            hintText: "Confirm Password",
            controller: confpassword,
            inputType: TextInputType.visiblePassword,
            value: (value) {
              rModel.confirmPassword = value;
            },
          ),
          _createButton()
        ],
      ),
    );
  }

  Widget _createButton () {
    return Container(
      margin: EdgeInsets.only(top:20),
        child: RaisedButton(
          color: Colors.transparent,
          splashColor: Colors.transparent,
          disabledColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(11))
          ),
          padding: EdgeInsets.all(0),
          onPressed: () {
            if (this._keyForm.currentState.validate()) {
              if (_selfValidation()) {
                this.rModel.setInformation(rModel);
                Route route = MaterialPageRoute(builder: (context) => dashboard());
                Navigator.pushAndRemoveUntil(context, route, (Route<dynamic> route) => false);
              }
            }
          },
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    'SUBMIT',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.white
                    ),
                  ),
                  decoration: BoxDecoration(
                    gradient: colorExtension().purpleGradient(),
                    borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                )
              )
            ],
          ),
      )
    );
  }

  bool _selfValidation () {
    if (this.rModel.password == this.rModel.confirmPassword) {
      return true;
    }
    return false;
  }

}

