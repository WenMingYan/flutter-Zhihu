import 'package:flutter/material.dart';

class TopTabPage extends StatelessWidget {
  const TopTabPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Top Tab"),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.directions_bike),
              ),
              Tab(
                icon: Icon(Icons.directions_boat),
              ),
              Tab(
                icon: Icon(Icons.directions_bus),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Icon(Icons.directions_bike),
            Icon(Icons.directions_boat),
            Icon(Icons.directions_bus),
          ],
        ),
      ),
    );
  }
}
