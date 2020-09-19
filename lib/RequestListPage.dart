import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'Photo.dart';
import 'dart:async';
// import 'package:http/http.dart' as http;

class RequestListPage extends StatefulWidget {
  RequestListPage({Key key}) : super(key: key);

  @override
  _RequestListPageState createState() => _RequestListPageState();
}

class _RequestListPageState extends State<RequestListPage> {
  @override
  void initState() {
    requetPhotos();
    super.initState();
  }

  Future<Photo> futurePhoto;
  bool _loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Request List Page"),
          actions: [
            GestureDetector(
              onTap: () {
                print("object");
              },
              child: Icon(Icons.phone),
            )
          ],
        ),
        body: Container(
          child: RaisedButton(
              child: Text("request data"),
              onPressed: _loading
                  ? null
                  : () async {
                      setState(() {
                        _loading = true;
                      });
                      try {
                        print("begin request");
                        String responseBody = requetPhotos() as String;
                      } catch (e) {
                        _loading = false;
                        print("request failure");
                      } finally {
                        _loading = false;
                      }
                    }),
        )
        // body: FutureBuilder(
        //     future: fetchPhotos(http.Client()),
        //     builder: (context, snapshot) {
        //       if (snapshot.hasError) {
        //         print(snapshot.error);
        //       }
        //       return snapshot.hasData
        //           ? PhotoList(
        //               photos: snapshot.data,
        //             )
        //           : Center(
        //               child: CircularProgressIndicator(),
        //             );
        //     }),
        );
  }

// 自己写的请求
  Future<String> requetPhotos() async {
    HttpClient httpClient = new HttpClient();
    Uri uri = Uri(
        scheme: "https",
        host: "jsonplaceholder.typicode.com",
        path: "photos",
        queryParameters: null);
    HttpClientRequest request = await httpClient.getUrl(uri);
    // request.headers.add("user-agent", "test");
    HttpClientResponse response = await request.close();
    httpClient.close();
    // 读取响应内容
    String responseBody = await response.transform(utf8.decoder).join();
    return responseBody;
  }

  // List<Photo> parsePhotos(String responseBody) {
  //   final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  //   return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
  // }

  // Future<List<Photo>> fetchPhotos(http.Client client) async {
  //   final response =
  //       await client.get('https://jsonplaceholder.typicode.com/photos');

  //   return compute(parsePhotos, response.body);
  // }
}

class PhotoList extends StatelessWidget {
  final List<Photo> photos;
  const PhotoList({Key key, this.photos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: photos.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (centext, index) {
          return Image.network(photos[index].thumbnailUrl);
        });
  }
}
