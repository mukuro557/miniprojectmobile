import 'dart:async';
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
  double _reduce = 60.00;
  int count = 0;

  void checktime() {
    _reduce = 60.00;
    count = 0;
    reduction();
  }

  void reduction() {
    Timer.periodic(Duration(milliseconds: 1), (timer) {
      setState(() {
        _reduce = _reduce - 0.01;
      });
      if (_reduce < 0.00) {
        timer.cancel();
        setState(() {
          _reduce = 0.00;
        });
      }
    });
  }

  void clickable() {
    if (_reduce > 0 && _reduce != 1) {
      count++;
    }
  }

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
    checktime();
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
      backgroundColor: Color.fromRGBO(216, 236, 228, 10),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            width: 500,
            height: 110,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 290, top: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipOval(
                        child: Material(
                          color: Colors.blue[900], // button color
                          child: InkWell(
                            splashColor: Colors.red, // inkwell color
                            child: SizedBox(
                                width: 52,
                                height: 52,
                                child: Icon(
                                  Icons.history,
                                  size: 40,
                                  color: Colors.white,
                                )),
                            onTap: () {},
                          ),
                        ),
                      ),
                      Text('HISTORY'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipOval(
                        child: Material(
                          color: Colors.blue[500], // button color
                          child: InkWell(
                            splashColor: Colors.red, // inkwell color
                            child: SizedBox(
                                width: 52,
                                height: 52,
                                child: Icon(
                                  Icons.star,
                                  size: 35,
                                  color: Colors.white,
                                )),
                            onTap: () {},
                          ),
                        ),
                      ),
                      Text('MY FAVARITE')
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Column(
                  children: [
                    Image.asset(
                      'asset/images/time.png',
                      scale: 2.5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("time  = ${_reduce.toStringAsFixed(1)}"),
                        IconButton(
                            icon: Icon(Icons.refresh),
                            onPressed: () {
                              checktime();
                            })
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 180,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 65),
                child: Column(
                  children: [
                    Image.asset(
                      'asset/images/scoring.png',
                      scale: 2.5,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("score  = $count"),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Stack(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                child: Image.asset(
                  'asset/images/bg.png',
                  height: 100,
                  width: 500,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 80,
                      height: 65,
                    ),
                    Container(
                      height: 80,
                      width: 250,
                      child: Text(
                        quesion+" ?",
                        style: TextStyle(fontSize: 30),
                      ),
                    )
                    // Container(
                    //   height: 40,
                    //   width: 220,
                    //   child: ListView(
                    //     scrollDirection: Axis.horizontal,
                    //     children: [
                    //       Container(
                    //         child: Text(
                    //           quesion + "isusususususus ?",
                    //           style: TextStyle(
                    //               fontSize: 30, fontWeight: FontWeight.bold),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
          Spacer(
            flex: 2,
          ),
          Container(
            width: 350,
            height: 100,
            child: RaisedButton(
              color: Color.fromRGBO(208, 233, 231, 1),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(80)),
              onPressed: () {
                if (_reduce > 0 && _reduce != 1) {
                  if (_button == 1) {
                    clickable();
                    _randomleftright();
                    _randomword();

                    (() async {
                      await helper.opendb();
                      _getNames();
                    })();
                    _mode();
                  } else {
                    _randomleftright();
                    _randomword();

                    (() async {
                      await helper.opendb();
                      _getNames();
                    })();
                    _mode();
                  }
                }
              },
              child: Text(
                left,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  shadows: [
                    Shadow(
                        offset: Offset(
                          -1.5,
                          -1.5,
                        ),
                        color: Colors.white),
                    Shadow(
                        offset: Offset(
                          1.5,
                          -1.5,
                        ),
                        color: Colors.white),
                    Shadow(
                        offset: Offset(
                          -1.5,
                          1.5,
                        ),
                        color: Colors.white),
                    Shadow(
                        offset: Offset(
                          1.5,
                          1.5,
                        ),
                        color: Colors.white),
                  ],
                ),
              ),
            ),
          ),
          Spacer(),
          Container(
            width: 350,
            height: 100,
            child: RaisedButton(
              color: Color.fromRGBO(208, 233, 231, 1),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(80)),
              onPressed: () {
                if (_reduce > 0 && _reduce != 1) {
                  if (_button == 2) {
                    clickable();
                    _randomleftright();
                    _randomword();

                    (() async {
                      await helper.opendb();
                      _getNames();
                    })();
                    _mode();
                  } else {
                    _randomleftright();
                    _randomword();

                    (() async {
                      await helper.opendb();
                      _getNames();
                    })();
                    _mode();
                  }
                }
              },
              child: Text(
                right,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  shadows: [
                    Shadow(
                        offset: Offset(
                          -1.5,
                          -1.5,
                        ),
                        color: Colors.white),
                    Shadow(
                        offset: Offset(
                          1.5,
                          -1.5,
                        ),
                        color: Colors.white),
                    Shadow(
                        offset: Offset(
                          -1.5,
                          1.5,
                        ),
                        color: Colors.white),
                    Shadow(
                        offset: Offset(
                          1.5,
                          1.5,
                        ),
                        color: Colors.white),
                  ],
                ),
              ),
            ),
          ),
          Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }
}
