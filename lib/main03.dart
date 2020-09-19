import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: "MY App",
      home: TotorialHome(),
    ));

class TotorialHome extends StatelessWidget {
  const TotorialHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.menu),
            tooltip: "Navigator menu",
            onPressed: () {
              print("menu");
            }),
        title: Text("Flutter Totorial"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                print("search");
              }),
        ],
      ),
      body: Center(
        child: MyButton(),
      ),
      floatingActionButton: FloatingActionButton(
          tooltip: 'Add', child: Icon(Icons.add), onPressed: () {}),
    );
  }
}

class MyButton extends StatelessWidget {
  const MyButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("tapped");
      },
      child: Container(
        height: 36.0,
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.lightGreen[500],
        ),
        child: Text(
          'MyButton',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
