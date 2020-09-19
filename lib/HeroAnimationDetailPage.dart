import 'package:flutter/material.dart';

class HeroAnimationDetailPage extends StatelessWidget {
  const HeroAnimationDetailPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hero animation detail"),
      ),
      body: Center(
          child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Hero(
          tag: 'Hero',
          child: Image.network(
            'https://picsum.photos/250?image=9',
            width: 400,
            height: 400,
          ),
        ),
      )),
    );
  }
}
