import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class FloatingBarPage extends StatelessWidget {
  const FloatingBarPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> titles = [];
    for (var i = 0; i < 10; i++) {
      String title = WordPair.random().asPascalCase;
      titles.add(title);
    }
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Text("Floating Bar"),
          floating: true,
          flexibleSpace: Placeholder(),
          expandedHeight: 200,
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(
                    title: Text(titles[index]),
                  ),
              childCount: titles.length),
        )
      ],
    ));
  }
}
