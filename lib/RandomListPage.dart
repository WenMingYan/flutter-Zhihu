import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class RandomListPage extends StatefulWidget {
  RandomListPage({Key key}) : super(key: key);

  @override
  _RandomListPageState createState() => _RandomListPageState();
}

class _RandomListPageState extends State<RandomListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Random List"),
      ),
      body: DismissableWidget(),
    );
  }
}

class DismissableWidget extends StatefulWidget {
  DismissableWidget({Key key}) : super(key: key);

  @override
  _DismissableWidgetState createState() => _DismissableWidgetState();
}

class _DismissableWidgetState extends State<DismissableWidget> {
  List<Map> _texts = [];
  void _buildTexts() {
    for (var i = 0; i < 20; i++) {
      Map item = new Map();
      String text = WordPair.random().asPascalCase;
      String subTitle = WordPair.random().asPascalCase;
      item["title"] = text;
      item["subTitle"] = subTitle;
      this._texts.add(item);
    }
  }

  @override
  Widget build(BuildContext context) {
    _buildTexts();
    return ListView.builder(
      itemCount: this._texts.length,
      itemBuilder: (BuildContext context, int index) {
        Map item = this._texts[index];
        return Dismissible(
            background: Container(
              color: Colors.purple,
            ),
            onDismissed: (direction) {
              setState(() {
                this._texts.removeAt(index);
              });
              if (direction == DismissDirection.startToEnd) {
                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text("${item["title"]}")));
              }
            },
            key: Key(item["title"]),
            child: ListTile(
              title: Text(item["title"]),
              subtitle: Text(item["subTitle"]),
            ));
      },
    );
  }
}
