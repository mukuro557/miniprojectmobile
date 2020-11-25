import 'package:flutter/material.dart';

import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:miniprojectdic/speech.dart';
import 'package:miniprojectdic/sqlitehelp.dart';
import 'package:miniprojectdic/vocab.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
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

  _HomepageState() {
    textField = SimpleAutoCompleteTextField(
      submitOnSuggestionTap: true,
      key: key,
      decoration: new InputDecoration(
        hintText: "Search....",
        border: InputBorder.none,
      ),
      suggestions: suggestions,
      textChanged: (text) => currentText = text,
      clearOnSubmit: true,
      textSubmitted: (text) => setState(() {
        if (text != "") {
          added.add(text);
          _save();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Vocab(),
            ),
          );
        }
      }),
    );
  }

  _save() async {
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
    })();
  }

  @override
  Widget build(BuildContext context) {
    Column body = new Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 35, right: 35, top: 60),
          child: Container(
            decoration: BoxDecoration(
                color: Color(0xFFE0E0E0),
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: new ListTile(
              title: textField,
              trailing: new IconButton(
                icon: new Icon(Icons.search),
                onPressed: () async {
                  textField.triggerSubmitted();
                  showWhichErrorText = !showWhichErrorText;
                  textField.updateDecoration(
                    decoration: new InputDecoration(hintText: "Search...."),
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
          child: Container(
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 50, left: 40, bottom: 20),
                      child: Text(
                        'Your History',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40,left: 140),
                      child: FlatButton(
                        onPressed: () {},
                        child: Icon(Icons.delete,size: 20,color: Colors.white,),
                        color: Colors.blue[400],
                        shape: CircleBorder(
                          side: BorderSide(
                            color: Colors.blue[400],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: Column(
                    children: [
                      Container(
                          height: 100,
                          width: 400,
                          margin: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.blue[50],
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Row(
                            children: [
                              Spacer(),
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 205, top: 15, bottom: 20),
                                    child: Text(
                                      'abandon',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.lightBlue),
                                    ),
                                  ),
                                  Text(
                                      '[VT]ทิ้ง, ทอดทิ้ง, ละทิ้ง, ทิ้งขว้าง, ผละ, จากไป')
                                ],
                              ),
                              Spacer(
                                flex: 2,
                              ),
                              GestureDetector(
                                child: Icon(
                                    isSaved ? Icons.star : Icons.star_border,
                                    color: isSaved ? Colors.yellow[800] : null),
                                onTap: () {
                                  setState(() {
                                    if (isSaved == false) {
                                      isSaved = true;
                                    } else {
                                      isSaved = false;
                                    }
                                  });
                                },
                              ),
                              Spacer(),
                            ],
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );

    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        // appBar: new AppBar(
        //   elevation: 0,
        //   backgroundColor: Colors.white,
        //   title: new Text(''),
        // ),
        body: body);
  }
}
