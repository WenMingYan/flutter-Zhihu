import 'dart:convert';
import 'Album.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RequstTestPage extends StatefulWidget {
  RequstTestPage({Key key}) : super(key: key);

  @override
  _RequstTestPageState createState() => _RequstTestPageState();
}

class _RequstTestPageState extends State<RequstTestPage> {
  Future<Album> futureAlbum;
  @override
  void initState() {
    futureAlbum = await _requestData();
    print("${futureAlbum.hashCode}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Request List"),
        ),
        body: FutureBuilder(builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text("${snapshot.data.title}");
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return CircularProgressIndicator();
        }));
  }

  Future<Album> _requestData() async {
    print("---");
    final response =
        await http.get('https://jsonplaceholder.typicode.com/albums/1');
    if (response.statusCode == 200) {
      print("aaa");
      Album futureAlbum = Album.fromJson(json.decode(response.body));
      return futureAlbum;
    } else {
      print("bbb");
      throw Exception('Failed to load album');
    }
  }
}
