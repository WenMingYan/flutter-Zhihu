import 'dart:math';

import 'package:flutter/material.dart';

class AnimationPage extends StatefulWidget {
  AnimationPage({Key key}) : super(key: key);

  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {
  @override
  // 以下为动画变量
  double _width = 100;
  double _height = 100;
  Color _color = Colors.green;

  BorderRadius _borderRadius = BorderRadius.circular(8);
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation"),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.play_arrow),
          onPressed: () {
            print("floating");
            setState(() {
              _animation();
            });
          }),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          width: _width,
          height: _height,
          decoration: BoxDecoration(color: _color, borderRadius: _borderRadius),
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );
  } // build

  void _animation() {
    var random = Random();
    _width = random.nextInt(300).toDouble();
    _height = random.nextInt(300).toDouble();

    _color = Color.fromRGBO(
        random.nextInt(256), random.nextInt(256), random.nextInt(256), 1);
    _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble());
  }
}
