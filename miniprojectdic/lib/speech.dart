import 'package:flutter/material.dart';

import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:miniprojectdic/speech.dart';
import 'package:miniprojectdic/sqlitehelp.dart';
import 'package:miniprojectdic/vocab.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Speech extends StatefulWidget {
  @override
  _SpeechState createState() => _SpeechState();
}

class _SpeechState extends State<Speech> {
  final FlutterTts flutterTts = FlutterTts();
  String eng = 'abhorrence';
  String th = '';
  String ecat = "";
  String esyn = "";
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
  int _length;

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
    await flutterTts.speak(th);
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
      textChanged: (text) => currentText = text,
      clearOnSubmit: true,
      textSubmitted: (text) => setState(() {
        if (text != "") {
          added.insert(0, text);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Vocab(),
            ),
          );
          save();
          print(added);
        }
      }),
    );
  }

  removeinfo() async {
    SharedPreferences history = await SharedPreferences.getInstance();
    history.remove("history");
  }

  check() async {
    SharedPreferences history = await SharedPreferences.getInstance();
    var dataofStore = history.getStringList("history");
    print(dataofStore);

    await setState(() {
      data = dataofStore;
    });
  }

  save() async {
    SharedPreferences history = await SharedPreferences.getInstance();
    history.setStringList("history", added);
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
      await check();
    })();
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
        Padding(
          padding: const EdgeInsets.only(left: 35, right: 35, top: 30),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: new ListTile(
              title: textField,
              trailing: new IconButton(
                icon: new Icon(Icons.search),
                onPressed: () async {
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
            padding: const EdgeInsets.only(right: 20, top: 20),
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
                              'Word of the day',
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
                                child: Text('[N]'),
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
                                  child: InkWell(
                                    splashColor: Colors.red, // inkwell color
                                    child: SizedBox(
                                        width: 36,
                                        height: 36,
                                        child: Icon(
                                          Icons.star,
                                          size: 25,
                                          color: Colors.white,
                                        )),
                                    onTap: () {},
                                  ),
                                ),
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
                                      child: Text(
                                          'การเปิดเทปให้ดูใหม่อีกครั้ง  เช่น ภาพการแข่งขันกีฬา โดยมากมักจะเป็นภาพเคลื่อนไหวช้า ๆ ให้ดูกันใหม่'),
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
                                      child: Text(
                                          'authorize; give credentials to; certify'),
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
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: ClipOval(
                    child: Material(
                      color: Colors.white, // button color
                      child: InkWell(
                        splashColor: Colors.blue, // inkwell color
                        child: SizedBox(
                            width: 72,
                            height: 72,
                            child: Image.asset('asset/images/vioce command.png')),
                        onTap: () {},
                      ),
                    ),
                  ),
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
