import 'package:flutter/material.dart';

class DrawPage extends StatefulWidget {
  DrawPage({Key key}) : super(key: key);

  @override
  _DrawPageState createState() => _DrawPageState();
}

class _DrawPageState extends State<DrawPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
              child:
                  Text("Drawer Header", style: TextStyle(color: Colors.white)),
              decoration: BoxDecoration(color: Colors.blue)),
          ListTile(
              title: Text("item1"),
              onTap: () {
                print("item1");
                Navigator.pop(context);
              }),
          ListTile(
              title: Text("item2"),
              onTap: () {
                print("item2");
                Navigator.pop(context);
              })
        ],
      )),
      appBar: AppBar(
        title: Text("Drawer Test"),
      ),
      body: Text("touch left action"),
    );
  }
}
