import 'package:flutter/material.dart';

class ClickRipplePage extends StatelessWidget {
  const ClickRipplePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Click Ripple"),
      ),
      body: Center(
          child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            InkWell(
              onDoubleTap: () {
                print("object");
              },
              child: Text(
                "data",
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            Divider(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                print("tap");
              },
              child: Text(
                "Gesture Detector",
                style: TextStyle(fontSize: 20.0),
              ),
            )
          ],
        ),
      )),
    );
  }
}
