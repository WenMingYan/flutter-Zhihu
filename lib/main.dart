import 'package:Zhihu/CustomFont.dart';
import 'package:Zhihu/FloatingBarPage.dart';
import 'package:Zhihu/FormPage.dart';
import 'package:Zhihu/HeroAnimationDetailPage.dart';
import 'package:Zhihu/HeroAnimationPage.dart';
import 'package:Zhihu/ImagePage.dart';
import 'package:Zhihu/RandomListPage.dart';
import 'package:Zhihu/RequestListPage.dart';
import 'package:Zhihu/RequestTestPage.dart';
import 'package:Zhihu/ScreenRotationPage.dart';
import 'package:Zhihu/SnackBarPage.dart';
import 'package:Zhihu/TopTabPage.dart';
import 'package:Zhihu/clickRipplePage.dart';
import 'package:flutter/material.dart';
import 'package:Zhihu/AnimationPage.dart';
import 'package:Zhihu/FadeInOutPage.dart';
import 'package:Zhihu/DrawPage.dart';

void main() => runApp(MaterialApp(
      // 定义app的风格
      theme: ThemeData(
          textTheme: TextTheme(
            headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            bodyText2: TextStyle(
              fontSize: 14.0,
            ),
            headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          ),
          accentColor: Colors.cyan[600],
          fontFamily: 'Raleway',
          brightness: Brightness.light,
          primaryColor: Colors.lightBlue[800]),
      initialRoute: "/",
      routes: {
        "/": (context) => HomePage(),
        "/animation": (context) => AnimationPage(),
        "/fadeinout": (context) => FadeInOutPage(),
        "/draw": (context) => DrawPage(),
        "/snackbar": (context) => SnackPage(),
        "/customfont": (context) => CustomFontPage(),
        "/screenrotation": (context) => ScreenRotationPage(),
        "/toptab": (context) => TopTabPage(),
        "/form": (context) => FormPage(),
        "/clickripple": (context) => ClickRipplePage(),
        "/list": (context) => RandomListPage(),
        "/image": (context) => ImagePage(),
        "/floatingBar": (context) => FloatingBarPage(),
        "/heroanimation": (context) => HeroAnimationPage(),
        "/heroanimationdetail": (context) => HeroAnimationDetailPage(),
        "/request": (context) => RequstTestPage(), //TODO: 该请求有问题
        "/requestlist": (context) => RequestListPage(),
      },
    ));

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final _routes = [
    {"title": "animation", "route": "/animation"},
    {"title": "fade in out", "route": "/fadeinout"},
    {"title": "Draw", "route": "/draw"},
    {"title": "Snack", "route": "/snackbar"},
    {"title": "Custom Font", "route": "/customfont"},
    {"title": "Screen Rotation", "route": "/screenrotation"},
    {"title": "Top Tab", "route": "/toptab"},
    {"title": "Form Page", "route": "/form"},
    {"title": "Random List", "route": "/list"},
    {"title": "Image", "route": "/image"},
    {"title": "Floating Bar", "route": "/floatingBar"},
    {"title": "Hero Animation", "route": "/heroanimation"},
    {"title": "Request Test", "route": "/request"},
    {"title": "Request List", "route": "/requestlist"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Demo"),
        ),
        body: _home());
  }

  Widget _home() {
    return Container(
      child: ListView.builder(
          itemCount: _routes.length * 2,
          // itemExtent: 40.0,
          itemBuilder: (BuildContext context, int i) {
            int index = i ~/ 2;
            var map = _routes[index];
            if (i.isOdd) {
              return Divider();
            } else {
              return ListTile(
                title: Text(map["title"]),
                onTap: () {
                  Navigator.of(context).pushNamed(map["route"]);
                },
              );
            }
          }),
    );
  } // home
}
