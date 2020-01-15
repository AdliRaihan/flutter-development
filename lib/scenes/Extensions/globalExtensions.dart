

import 'package:adli_train/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class globalExtension {

  UnderlineInputBorder makeTFCircled () {
    return  UnderlineInputBorder(
      borderRadius: BorderRadius.circular(25),
      borderSide: BorderSide(color: Colors.white)
    );
  }


}


class classificationTextField extends StatefulWidget {

  
  ValueChanged<String> value;
  final String hintText;
  final TextEditingController controller;
  TextInputType inputType = TextInputType.text;

  classificationTextField ( {
    this.hintText,
    this.controller,
    this.inputType,
    this.value
  }) : assert (inputType != null);

  @override
  State<StatefulWidget> createState() {
    return _classificationTextField(
      hintText: hintText,
      controller: controller,
      inputType: inputType,
      value:  (value) {
        if (value.isNotEmpty) {
          callbacks(value);
        }
      }
    );
  }

  void callbacks(String value) async {
    this.value(value);
  }

}

class _classificationTextField extends State<classificationTextField> {

  ValueChanged<String> value;
  final String hintText;
  final TextEditingController controller;
  TextInputType inputType = TextInputType.text;

  _classificationTextField ( {
    this.hintText,
    this.controller,
    this.inputType,
    this.value
  });

  bool validationValid = true;
  
  bool isPasswordField (TextInputType inputType) {
    if (inputType == TextInputType.visiblePassword) 
      return true;
    return false;
  }

  @override
  Widget build(BuildContext context) {
     return Container (
      margin: EdgeInsets.only(top: 10,bottom: 10),
      child: Material(
        elevation: 5.0,
        shadowColor: Colors.black.withOpacity(0.25),
        color: validationValid ? Colors.white : Color(0xffffd4d4),
        child: TextFormField(
          onChanged: (value) {
            this.value(value);
          },
          style: TextStyle(
            color: Colors.black45
          ),
          validator: (value) {
            setState(() {
              if (value.isEmpty)
                validationValid = false;
              else
                validationValid = true;
            });
            
            if (value.isEmpty) {
              return "";
            } else {
              return null;
            }
          },
          controller: controller,
          keyboardType: inputType,
          obscureText: isPasswordField(inputType),
          decoration: InputDecoration(
            focusedErrorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent)
            ),
            errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent)
            ),

            errorStyle: TextStyle(
              height: 0
            ),

            contentPadding: EdgeInsets.only(
              left: 15,
              right: 15,
              top: 15,
              bottom: 15
            ),
            hintStyle: TextStyle(
              color:  Colors.black26
            ),
            hintText: validationValid ? hintText : hintText + " (Required)",
            enabledBorder: makeTFCircled(),
            focusedBorder: makeTFCircled()

          ),
        ),
      )
    );
  }

  
  UnderlineInputBorder makeTFCircled () {
    return  UnderlineInputBorder(
      borderRadius: BorderRadius.circular(25),
      borderSide: BorderSide(color: Colors.transparent)
    );
  }

}