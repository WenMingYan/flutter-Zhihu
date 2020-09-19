import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: "MY App",
      debugShowCheckedModeBanner: false,
      home: MyScaffold(),
    ));

class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Material is a conceptual piece of paper on which the UI appears.
    return Material(
      // Column is a vertical, linear layout.
      child: Column(
        children: <Widget>[
          MYAppBar(
            title: Text(
              'Example title',
              style: Theme.of(context).primaryTextTheme.headline6,
            ),
          ),
          Expanded(
            child: Center(
              child: Text('Hello, world!'),
            ),
          ),
        ],
      ),
    );
  }
}

class MYAppBar extends StatelessWidget {
  MYAppBar({this.title});
  final Widget title;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        height: 56,
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(color: Colors.blue),
        child: Row(
          children: <Widget>[
            IconButton(icon: Icon(Icons.menu), onPressed: null),
            Expanded(
              child: title,
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: null,
              tooltip: "search",
            )
          ],
        ),
      ),
    );
  }
}
