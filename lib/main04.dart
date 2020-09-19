import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:Zhihu/FavoratePage.dart';
import 'package:Zhihu/AnimationPage.dart';

void main() => runApp(MaterialApp(
      //   onGenerateRoute: (settings) {
      // // If you push the PassArguments route
      // if (settings.name == PassArgumentsScreen.routeName) {
      //   // Cast the arguments to the correct type: ScreenArguments.
      //   final ScreenArguments args = settings.arguments;

      //   // Then, extract the required data from the arguments and
      //   // pass the data to the correct screen.
      //   return MaterialPageRoute(
      //     builder: (context) {
      //       return PassArgumentsScreen(
      //         title: args.title,
      //         message: args.message,
      //       );
      //     },
      //   );
      // }

      initialRoute: "/",
      routes: {
        "/": (context) => RandomWords(),
        "/favorate": (context) => FavoratePage(),
        "/animation": (context) => AnimationPage(),
      },
    ));

class RandomWords extends StatefulWidget {
  RandomWords({Key key}) : super(key: key);

  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final List<WordPair> _suggestions = <WordPair>[];
  final Set<WordPair> _saved = new Set<WordPair>();
  final _biggerFont = TextStyle(fontSize: 18.0);

  void _pushSaved(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      final Iterable<ListTile> tiles = _saved.map((WordPair pair) {
        return ListTile(
          title: Text(
            pair.asPascalCase,
            style: _biggerFont,
          ),
        );
      });
      final List<Widget> divided = ListTile.divideTiles(
        context: context,
        tiles: tiles,
      ).toList();
      return new Scaffold(
        appBar: new AppBar(
          title: const Text('Saved Suggestions'),
        ),
        body: new ListView(children: divided),
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Startup Name Generator"),
        actions: <Widget>[
          // IconButton(
          //     icon: Icon(Icons.menu),
          //     color: Colors.white,
          //     onPressed: () {
          //       _pushSaved(context);
          //     }), // 老的favorate跳转
          IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                // Navigator.push(context,
                // MaterialPageRoute(builder: (context) => FavoratePage()));
                Navigator.pushNamed(context, '/favorate',
                    arguments: ScreenArguments(_saved));
              }),
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                Navigator.pushNamed(context, '/animation');
              })
        ],
      ),
      body: Center(
        child: _buildSuggestions(),
      ),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          // context 为BuildContext i为行
          // 每调用一次，i就会自增
          if (i.isOdd) {
            return Divider();
          }
          final index = i ~/ 2; // 除以2，向下取整
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    final bool alreadySaved = _saved.contains(pair);
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      onTap: () {
        setState(() {
          if (_saved.contains(pair)) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
    );
  }
}
