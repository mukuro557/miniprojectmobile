import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:miniprojectdic/favorite.dart';
import 'package:miniprojectdic/gamesec.dart';
import 'package:miniprojectdic/history.dart';
import 'package:miniprojectdic/sqlitehelp.dart';
import 'package:miniprojectdic/vocab.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final FlutterTts flutterTts = FlutterTts();
  String eng = 'abhorrence';
  String th1 =
      'การเปิดเทปให้ดูใหม่อีกครั้ง  เช่น ภาพการแข่งขันกีฬา โดยมากมักจะเป็นภาพเคลื่อนไหวช้า ๆ ให้ดูกันใหม่';
  String ecat = "[N]";
  String esyn = "authorize; give credentials to; certify";
  String ethai = "";
  var data = [];
  bool isSaved = false;
  List<String> added = [];
  String currentText = "";
  GlobalKey<AutoCompleteTextFieldState<String>> key = new GlobalKey();
  SqliteHelper helper = SqliteHelper();
  List names = new List();
  List filteredNames = new List();
  List<Map<String, dynamic>> dataA = [];
  List<Map<String, dynamic>> dataB = [];
  List<String> suggestions = [];
  bool checkdup = true;
  var fav = [
    {"esearch": '', "tentry": ''}
  ];

  Future _speakeng() async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1);
    print(await flutterTts.getVoices);
    await flutterTts.speak(eng);
  }

  Future _speakTH() async {
    await flutterTts.setLanguage("th-TH");
    await flutterTts.setPitch(1);
    print(await flutterTts.getVoices);
    await flutterTts.speak(th1);
  }

  _HomepageState() {
    textField = SimpleAutoCompleteTextField(
      submitOnSuggestionTap: true,
      key: key,
      decoration: new InputDecoration(
        hintText: "Type your word here.",
        border: InputBorder.none,
      ),
      suggestions: suggestions,
      clearOnSubmit: true,
      textChanged: (text) => currentText = text,
      textSubmitted: (text) => setState(() {
        if (text != "") {
          added.insert(0, text);
          _data();
        }
      }),
    );
  }
  Future _savefav() async {
    fav[fav.length - 1]['esearch'] = eng;
    fav[fav.length - 1]['tentry'] = th1;
    fav.add({});
    print(fav);
    _checkfavor();
  }

  _checkfavor() {
    setState(() {
      for (int i = 0; i < fav.length; i++) {
        if (eng == fav[i]['esearch']) {
          checkdup = false;
          break;
        } else {
          checkdup = true;
        }
      }
    });
  }

  _data() async {
    dataB = await helper.finddb(added[0]);
    setState(() {
      if (dataB[0]['esearch'] == null) {
        eng = "";
      } else {
        eng = dataB[0]['esearch'];
      }
      if (dataB[0]['tentry'] == null) {
        th1 = '';
      } else {
        th1 = dataB[0]['tentry'];
      }
      if (dataB[0]['ecat'] == null) {
        ecat = '';
      } else {
        ecat = dataB[0]['ecat'];
      }
      if (dataB[0]['esyn'] == null) {
        esyn = '';
      } else {
        esyn = dataB[0]['esyn'];
      }
    });
    _checkfavor();
  }

  favorite() async {
    SharedPreferences favorite = await SharedPreferences.getInstance();
    var info = jsonEncode(fav);
    favorite.setString('fav', info);
  }

  SimpleAutoCompleteTextField textField;
  bool showWhichErrorText = false;

  void _getNames() async {
    dataA = await helper.searchdb();
    for (int i = 0; i < dataA.length; i++) {
      suggestions.add(dataA[i]['esearch']);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    (() async {
      await helper.opendb();
      await _getNames();
    })();
    _checkfavor();
  }

  @override
  Widget build(BuildContext context) {
    Column body = new Column(
      children: [
        Container(
          width: 500,
          height: 110,
          color: Colors.white,
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
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => History()));
                          },
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
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Favorite()));
                          },
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
        Padding(
          padding: const EdgeInsets.only(left: 35, right: 35, top: 60),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: new ListTile(
              title: textField,
              trailing: new IconButton(
                icon: new Icon(Icons.search),
                onPressed: () async {
                  print(added[0]);
                  _data();

                  textField.triggerSubmitted();
                  showWhichErrorText = !showWhichErrorText;
                  textField.updateDecoration(
                    decoration:
                        new InputDecoration(hintText: "Type your word here."),
                  );
                  SharedPreferences history =
                      await SharedPreferences.getInstance();
                  history.setStringList("history", added);
                },
              ),
            ),
          ),
        ),
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(right: 20, top: 50),
            child: Column(
              children: [
                Stack(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      child: Image.asset(
                        'asset/images/bg.png',
                        height: 400,
                        width: 500,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 120, top: 60),
                            child: Text(
                              'Tranlate',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 22.0,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 210,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 45),
                                child: Container(
                                  height: 55,
                                  width: 200,
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      Container(
                                        child: Text(
                                          eng,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 45.0),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 100,
                                height: 45,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(ecat),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              ClipOval(
                                child: Material(
                                  color: Colors.blue[800], // button color
                                  child: InkWell(
                                    splashColor: Colors.red, // inkwell color
                                    child: SizedBox(
                                        width: 36,
                                        height: 36,
                                        child: Icon(
                                          Icons.volume_up,
                                          size: 25,
                                          color: Colors.white,
                                        )),
                                    onTap: () => _speakeng(),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              ClipOval(
                                child: Material(
                                    color: Colors.blue[600], // button color
                                    child: checkdup
                                        ? InkWell(
                                            splashColor:
                                                Colors.red, // inkwell color
                                            child: SizedBox(
                                                width: 36,
                                                height: 36,
                                                child: Icon(
                                                  Icons.star,
                                                  size: 25,
                                                  color: Colors.white,
                                                )),
                                            onTap: () {
                                              _savefav();
                                            }
                                            // _savefav();
                                            )
                                        : Container(
                                            color: Colors.black,
                                            child: InkWell(
                                                splashColor: Colors
                                                    .black, // inkwell color
                                                child: SizedBox(
                                                    width: 36,
                                                    height: 36,
                                                    child: Icon(
                                                      Icons.star,
                                                      size: 25,
                                                      color: Colors.white,
                                                    )),
                                                onTap: null
                                                // _savefav();

                                                ),
                                          )),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 200,
                                height: 65,
                              ),
                              Container(
                                height: 30,
                                width: 200,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    Container(
                                      child: Text(th1),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(width: 200),
                              Container(
                                height: 55,
                                width: 200,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    Container(
                                      child: Text(esyn),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );

    return new Scaffold(
        backgroundColor: Color.fromRGBO(216, 236, 228, 10),
        resizeToAvoidBottomPadding: false,
        body: body);
  }
}
