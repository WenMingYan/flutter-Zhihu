import 'package:flutter/material.dart';

class SnackPage extends StatefulWidget {
  SnackPage({Key key}) : super(key: key);

  @override
  _SnackPageState createState() => _SnackPageState();
}

class _SnackPageState extends State<SnackPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("snack page"),
        ),
        body: SnackDemo());
  }
}

class SnackDemo extends StatelessWidget {
  const SnackDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _raiseButtonWidge(context),
    );
  }

  Widget _raiseButtonWidge(BuildContext context) {
    final SnackBar snackBar = SnackBar(
        content: Text("show snackBar"),
        action: SnackBarAction(
            label: "cancel",
            onPressed: () {
              print("cancel");
            }));
    return RaisedButton(
        child: Text("click button"),
        onPressed: () {
          Scaffold.of(context).showSnackBar(snackBar);
        });
  }
}
