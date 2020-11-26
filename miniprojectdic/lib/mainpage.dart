import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:miniprojectdic/game.dart';
import 'search.dart';
import 'package:miniprojectdic/home.dart';
import 'package:miniprojectdic/setting.dart';
import 'package:miniprojectdic/speech.dart';


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
                  Icons.mic,
                  color: Colors.lightBlue,
                ),
                child: Text(
                  'Speech',
                  style: TextStyle(color: Colors.lightBlue),
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.games,
                  color: Colors.lightBlue,
                ),
                child: Text(
                  'Game',
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
            child: Speech()
          ),
          Container(
            child: GameDemo(),
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
