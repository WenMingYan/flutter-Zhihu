import 'package:flutter/material.dart';

class ScreenRotationPage extends StatefulWidget {
  ScreenRotationPage({Key key}) : super(key: key);

  @override
  _ScreenRotationPageState createState() => _ScreenRotationPageState();
}

class _ScreenRotationPageState extends State<ScreenRotationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Screen Rotation"),
        ),
        body: OrientationBuilder(builder: (context, orientation) {
          return GridView.count(
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              crossAxisCount: (orientation == Orientation.portrait ? 2 : 3),
              children: List.generate(
                10,
                (index) => Container(
                    color: Colors.orange,
                    child: Center(
                        child: Text(
                      "$index",
                      style: TextStyle(
                          fontSize: 100.0, backgroundColor: Colors.blue),
                    ))),
              ));
        }));
  }
}
