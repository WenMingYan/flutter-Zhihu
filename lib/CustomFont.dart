import 'package:flutter/material.dart';

class CustomFontPage extends StatefulWidget {
  CustomFontPage({Key key}) : super(key: key);

  @override
  _CustomFontPageState createState() => _CustomFontPageState();
}

class _CustomFontPageState extends State<CustomFontPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Custom Font"),
      ),
      body: Center(
        child: Text(
          "some words that test Font",
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Raleway',
          ),
        ),
      ),
    );
  }
}
