import 'dart:ui';

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
          height: 100,
          child: TabBar(
            tabs: [
              Tab(
                child: ClipOval(
                  child: Material(
                    color: Color.fromRGBO(216, 236, 228, 10), // button color
                    child: InkWell(
                      splashColor: Colors.red, // inkwell color
                      child: SizedBox(
                          width: 56,
                          height: 56,
                          child: Image.asset(
                            'asset/images/home.png',
                            scale: 2.0,
                          )),
                    ),
                  ),
                ),
              ),
              Tab(
                child: ClipOval(
                  child: Material(
                    color: Color.fromRGBO(216, 236, 228, 10), // button color
                    child: InkWell(
                      splashColor: Colors.red, // inkwell color
                      child: SizedBox(
                          width: 56,
                          height: 56,
                          child: Image.asset(
                            'asset/images/voice.png',
                            scale: 2.5,
                          )),
                    ),
                  ),
                ),
              ),
              Tab(
                child: ClipOval(
                  child: Material(
                    color: Color.fromRGBO(216, 236, 228, 10), // button color
                    child: InkWell(
                      splashColor: Colors.red, // inkwell color
                      child: SizedBox(
                          width: 56,
                          height: 56,
                          child: Image.asset(
                            'asset/images/game.png',
                            scale: 2.5,
                          )),
                    ),
                  ),
                ),
              ),
              Tab(
                child: ClipOval(
                  child: Material(
                    color: Color.fromRGBO(216, 236, 228, 10), // button color
                    child: InkWell(
                      splashColor: Colors.red, // inkwell color
                      child: SizedBox(
                          width: 56,
                          height: 56,
                          child: Image.asset(
                            'asset/images/profile.png',
                            scale: 2.5,
                          )),
                    ),
                  ),
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
          Container(child: Speech()),
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
