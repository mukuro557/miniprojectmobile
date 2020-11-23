import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:miniprojectdic/home.dart';

class Mainpagedictionary extends StatefulWidget {
  @override
  _MainpagedictionaryState createState() => _MainpagedictionaryState();
}

class _MainpagedictionaryState extends State<Mainpagedictionary> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text('Tab Demo'),
        // ),
        bottomNavigationBar: Container(
          color: Colors.purple,
          child: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.home),
                text: 'Home',
              ),
              Tab(
                icon: Icon(Icons.search),
                text: 'Search',
              ),Tab(
                icon: Icon(Icons.keyboard_voice),
                text: 'Voice',
              ),
              Tab(
                icon: Icon(Icons.settings),
                text: 'Setting',
              ),
            ],
          ),
        ),
        body: TabBarView(children: [
          Container(
            child: Homepage(),
            color: Colors.yellow,
          ),
          Container(
            child: Text('Train'),
            color: Colors.green,
          ),
          Container(
            child: Text('Bike'),
            color: Colors.orange,
          ), Container(
            child: Text('Home'),
            color: Colors.yellow,
          ),
        ]),
      ),
    );
  }
}
