import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _container(),
    );
  }

  Widget _container() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                GestureDetector(
                  child: BackButton(
                    color: Colors.green,
                  ),
                )
              ],
            )
          ],
        )
      ),
    );
  }

}

