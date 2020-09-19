import 'package:flutter/material.dart';

class HeroAnimationPage extends StatefulWidget {
  HeroAnimationPage({Key key}) : super(key: key);

  @override
  _HeroAnimationPageState createState() => _HeroAnimationPageState();
}

class _HeroAnimationPageState extends State<HeroAnimationPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("hero animation"),
        ),
        body: Container(
          child: GestureDetector(
              onTap: () {
                print('onTap');
                Navigator.pushNamed(context, "/heroanimationdetail");
              },
              child: Hero(
                  tag: 'Hero',
                  child: Image.network(
                    'https://picsum.photos/250?image=9',
                    height: 300,
                    width: 300,
                  ))),
        ),
      ),
    );
  }
}
