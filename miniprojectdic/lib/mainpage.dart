import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:miniprojectdic/home.dart';
import 'package:miniprojectdic/setting.dart';

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
        bottomNavigationBar: Container(
          color: Colors.white,
          child: TabBar(
            tabs: [
              Tab(
                child: Text(
                  'Home',
                  style: TextStyle(color: Colors.lightBlue),
                ),
                icon: Icon(
                  Icons.home,
                  color: Colors.lightBlue,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.search,
                  color: Colors.lightBlue,
                ),
                child: Text(
                  'Search',
                  style: TextStyle(color: Colors.lightBlue),
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.keyboard_voice,
                  color: Colors.lightBlue,
                ),
                child: Text(
                  'Voice',
                  style: TextStyle(color: Colors.lightBlue),
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.settings,
                  color: Colors.lightBlue,
                ),
                child: Text(
                  'Settings',
                  style: TextStyle(color: Colors.lightBlue),
                ),
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
          ),
          Container(
            child: Settingdictionary(),
            color: Colors.yellow,
          ),
        ]),
      ),
    );
  }
}
