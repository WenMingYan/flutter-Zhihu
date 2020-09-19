import 'package:flutter/material.dart';

class FadeInOutPage extends StatefulWidget {
  FadeInOutPage({Key key}) : super(key: key);

  @override
  _FadeInOutPageState createState() => _FadeInOutPageState();
}

class _FadeInOutPageState extends State<FadeInOutPage> {
  bool _isVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FadeInOut Page"),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.flip),
          tooltip: "toggle Opacity",
          onPressed: () {
            setState(() {
              _isVisible = !_isVisible;
              print("$_isVisible");
            });
          }),
      body: Center(
        child: AnimatedOpacity(
          opacity: _isVisible ? 1.0 : 0.0,
          duration: Duration(milliseconds: 500),
          child: _fadeInOut(),
        ),
      ),
    );
  }

  Widget _fadeInOut() {
    return Container(
      height: 300.0,
      width: 300.0,
      color: Colors.blue,
    );
  }
}
