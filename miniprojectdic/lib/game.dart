import 'dart:math';

import 'package:flutter/material.dart';
import 'package:miniprojectdic/sqlitehelp.dart';

class GameDemo extends StatefulWidget {
  @override
  _GameDemoState createState() => _GameDemoState();
}

class _GameDemoState extends State<GameDemo> {
  SqliteHelper helper = SqliteHelper();
  int _button;
  int _wordans;
  int _wordque;
  var _answord = {"thai": "", "eng": ""};
  var _queword = {"thai": "", "eng": ""};
  List<Map<String, dynamic>> dataA = [];
  List<Map<String, dynamic>> dataB = [];
  int mode = 0;
  String quesion = '';
  String left = '';
  String right = '';

  _mode() {
    if (mode == 0) {
      //eng
      quesion = _queword['eng'];
      if (_button == 1) //left
      {
        left = _queword['thai'];
        right = _answord['thai'];
      } else {
        //right
        right = _queword['thai'];
        left = _answord['thai'];
      }
    } else {
      quesion = _queword['thai'];
      if (_button == 1) //left
      {
        left = _queword['eng'];
        right = _answord['eng'];
      } else {
        //right
        right = _queword['eng'];
        left = _answord['eng'];
      }
    }
  }

  _randomleftright() {
    setState(() {
      _button = Random().nextInt(2) + 1;
    });
  }

  _randomword() {
    setState(() {
      _wordans = Random().nextInt(45);
      _wordque = Random().nextInt(45);
    });

    if (_wordans == _wordque) {
      _randomword();
    }
  }

  void _getNames() async {
    dataA = await helper.findgame(_wordans);
    dataB = await helper.findgame(_wordque);
    setState(() {
      _queword['thai'] = dataB[0]['tentry'];
      _queword['eng'] = dataB[0]['esearch'];
      _answord['thai'] = dataA[0]['tentry'];
      _answord['eng'] = dataA[0]['esearch'];
    });

    //print(_queword['eng']);
    _mode();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _randomleftright();
    _randomword();

    (() async {
      await helper.opendb();
      _getNames();
    })();
    _mode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Game'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(quesion + " ?"),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                Container(
                  width: 150,
                  child: RaisedButton(
                    onPressed: null,
                    child: Text(left),
                  ),
                ),
                Spacer(),
                Container(
                  width: 150,
                  child: RaisedButton(
                    onPressed: null,
                    child: Text(right),
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
