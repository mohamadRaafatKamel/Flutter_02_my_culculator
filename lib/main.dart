import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MyCalculator());
}

class MyCalculator extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Calculator();
  }

}


class _Calculator extends State<Calculator> {

  // init val
  String text = '0';
  double numOne = 0;
  double numTwo = 0;
  String result = '0';
  String finalResult = '0';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: null,
      backgroundColor: Colors.black,
      body: Container(
        margin: EdgeInsets.only(bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              children: [
                Expanded(child: Text(
                  text,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 60
                  ),
                  maxLines: 1,
                  textAlign: TextAlign.right,
                )
                )
              ],
            ),
            Row(
              children: [
                mybutton("C"),
                mybutton("C"),
                mybutton("C"),
                mybutton("C"),
              ],
            )
          ],
        ),
      ),
    );
  }

  mybutton(name) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      child: RaisedButton(
        onPressed: () {},
        child: Text(name,
          style: TextStyle(
              fontSize: 30
          ),
        ),
        color: Colors.amber,
        padding: EdgeInsets.all(20),
        shape: CircleBorder(),
      ),
    );
  }

}