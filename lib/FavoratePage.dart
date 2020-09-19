import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class FavoratePage extends StatefulWidget {
  FavoratePage({Key key}) : super(key: key);

  @override
  _FavoratePageState createState() => _FavoratePageState();
}

class _FavoratePageState extends State<FavoratePage> {
  @override
  Widget build(BuildContext context) {
    ScreenArguments arguments = ModalRoute.of(context).settings.arguments;
    Set<WordPair> saved = arguments.saved;
    final Iterable<ListTile> tiles = saved.map((WordPair wordPair) => ListTile(
          title: Text("${wordPair.asPascalCase}"),
        ));
    final List<Widget> favorate = ListTile.divideTiles(
      context: context,
      tiles: tiles,
    ).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Favorate Page",
          style: TextStyle(fontSize: 18.0),
        ),
      ),
      body: ListView(
        children: favorate,
      ),
    );
  }
}

class ScreenArguments {
  final Set<WordPair> saved;
  ScreenArguments(this.saved);
}
