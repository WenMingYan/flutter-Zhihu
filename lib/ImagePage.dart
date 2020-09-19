import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImagePage extends StatelessWidget {
  const ImagePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Page"),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            CachedNetworkImage(
              // 有缓存的图片
              placeholder: (context, url) => CircularProgressIndicator(),
              imageUrl: 'https://picsum.photos/250?image=9',
            ),
            FadeInImage.assetNetwork(
                placeholder: 'assets/images/a.jpeg',
                image: "https://picsum.photos/250?image=9"),
            Image.network(
              "https://picsum.photos/250?image=9",
            ),
            Image.network(
              "https://github.com/flutter/plugins/raw/master/packages/video_player/video_player/doc/demo_ipod.gif?raw=true",
            ),
            Image.file(File('assets/images/a.jpeg'))
          ],
        ),
      ),
    );
  }
}
