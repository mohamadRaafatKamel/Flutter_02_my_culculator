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

  String opr = "";
  String prevOpr = "";

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
                Expanded(
                    child: Text(
                  text,
                  style: TextStyle(color: Colors.white, fontSize: 60),
                  maxLines: 1,
                  textAlign: TextAlign.right,
                ))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                mybutton("C", Color(0xffa5a5a5), 1),
                mybutton("+/-", Color.fromRGBO(165, 165, 165, 1), 1),
                mybutton("%", Color(0xffa5a5a5), 1),
                mybutton("/", Color(0xffff9800), 1),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                mybutton("7", Color(0xff323232), 1),
                mybutton("8", Color(0xff323232), 1),
                mybutton("9", Color(0xff323232), 1),
                mybutton("X", Color(0xffff9800), 1),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                mybutton("4", Color(0xff323232), 1),
                mybutton("5", Color(0xff323232), 1),
                mybutton("6", Color(0xff323232), 1),
                mybutton("-", Color(0xffff9800), 1),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                mybutton("1", Color(0xff323232), 1),
                mybutton("2", Color(0xff323232), 1),
                mybutton("3", Color(0xff323232), 1),
                mybutton("+", Color(0xffff9800), 1),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                mybutton("0", Color(0xff323232), 0),
                mybutton(".", Color(0xff323232), 1),
                mybutton("=", Color(0xffff9800), 1),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget mybutton(String btnText, Color color, int shap) {
    Container btn;
    if (shap != 0) {
      btn = Container(
        padding: EdgeInsets.only(bottom: 10),
        child: RaisedButton(
          onPressed: () {
            calculator(btnText);
          },
          child: Text(
            btnText,
            style: TextStyle(fontSize: 30),
          ),
          color: color,
          padding: EdgeInsets.all(20),
          shape: CircleBorder(),
        ),
      );
    } else {
      btn = Container(
        padding: EdgeInsets.only(bottom: 10),
        child: RaisedButton(
          onPressed: () {
            calculator(btnText);
          },
          child: Text(
            btnText,
            style: TextStyle(fontSize: 30),
          ),
          color: color,
          padding: EdgeInsets.only(left: 81, top: 20, right: 81, bottom: 20),
          shape: StadiumBorder(),
        ),
      );
    }
    return btn;
  }

  void calculator(txtBtn) {
    if (txtBtn == "C") {
      text = '0';
      numOne = 0;
      numTwo = 0;
      result = '0';
      finalResult = '0';
      opr = "";
      prevOpr = "";
    } else if (opr == '=' && txtBtn == '=') {
      switch (prevOpr) {
        case '+':
          finalResult = add();
          break;
        case '-':
          finalResult = sub();
          break;
        case 'X':
          finalResult = mul();
          break;
        case '/':
          finalResult = div();
          break;
      }
    } else if (txtBtn == '+' || txtBtn == '-' || txtBtn == 'X' || txtBtn == '/' || txtBtn == '=') {
      if (numOne == '0') {
        numOne = double.parse(result);
      } else {
        numTwo = double.parse(result);
      }

      switch (opr) {
        case '+':
          finalResult = add();
          break;
        case '-':
          finalResult = sub();
          break;
        case 'X':
          finalResult = mul();
          break;
        case '/':
          finalResult = div();
          break;
      }

      prevOpr = opr;
      opr = txtBtn;
      result = '';
    } else {
      if(result == '0')
        result = txtBtn;
      else
        result = result + txtBtn;
      finalResult = result;
    }

    setState(() {
      text = finalResult;
    });
  }

  String add() {
    result = (numOne + numTwo).toString();
    numOne = double.parse(result);
    return result;
  }

  String sub() {
    result = (numOne - numTwo).toString();
    numOne = double.parse(result);
    return result;
  }

  String mul() {
    result = (numOne * numTwo).toString();
    numOne = double.parse(result);
    return result;
  }

  String div() {
    result = (numOne / numTwo).toString();
    numOne = double.parse(result);
    return result;
  }
}
