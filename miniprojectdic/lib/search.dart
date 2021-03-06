import 'dart:convert';

import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:miniprojectdic/sqlitehelp.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SearchDemoState();
}

class _SearchDemoState extends State<SearchDemo> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: FirstPage(),
    );
  }
}

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => new _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  List<String> added = [];
  String currentText = "";
  GlobalKey<AutoCompleteTextFieldState<String>> key = new GlobalKey();
  SqliteHelper helper = SqliteHelper();
  List names = new List();
  List filteredNames = new List();
  List<Map<String, dynamic>> dataA = [];
  List<Map<String, dynamic>> dataB = [];
  List<String> suggestions = [];

  _FirstPageState() {
    textField = SimpleAutoCompleteTextField(
      submitOnSuggestionTap: true,
      key: key,
      decoration: new InputDecoration(hintText: "Search...."),
      suggestions: suggestions,
      textChanged: (text) => currentText = text,
      clearOnSubmit: true,
      textSubmitted: (text) => setState(() {
        if (text != "") {
          added.add(text);
          _save();
        }
      }),
    );
  }

  _save() async {
    SharedPreferences history = await SharedPreferences.getInstance();
    history.setStringList("history", added);
    print(history.getStringList("history"));
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
    Column body = new Column(children: [
      new ListTile(
        title: textField,
        trailing: new IconButton(
            icon: new Icon(Icons.search),
            onPressed: () async {
              textField.triggerSubmitted();
              showWhichErrorText = !showWhichErrorText;
              textField.updateDecoration(
                decoration: new InputDecoration(hintText: "Search...."),
              );
              SharedPreferences history = await SharedPreferences.getInstance();
              history.setStringList("history", added);
            }),
      ),
    ]);

    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: new AppBar(
          title: new Text('Tranlate'),
        ),
        body: body);
  }
}
