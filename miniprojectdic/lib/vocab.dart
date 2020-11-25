import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:miniprojectdic/sqlitehelp.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Vocab extends StatefulWidget {
  @override
  _VocabState createState() => _VocabState();
}

class _VocabState extends State<Vocab> {
  final FlutterTts flutterTts = FlutterTts();
  SqliteHelper helper = SqliteHelper();
  List<Map<String, dynamic>> dataA = [];
  bool isSaved = false;
  String eng = 'Apple';
  String th = 'แอปเปิ้ล';
  String ecat = "adj";
  String esyn = "apple";
  String ethai = "ผลแอปเปิ้ล";

  
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

  Future _copytxt() async {
    await FlutterClipboard.copy(th);
  }

  Future _copytxteng() async {
    await FlutterClipboard.copy(eng);
  }

  void _getNames() async {
    SharedPreferences history = await SharedPreferences.getInstance();
    var word = history.getStringList('history');
    int num = word.length - 1;
    print(word[num]);
    dataA = await helper.finddb(word[num]);
    eng = dataA[0]['esearch'];
    th = dataA[0]['tentry'];
    ecat = dataA[0]['ecat'];
    esyn = dataA[0]['esyn'];
    ethai = dataA[0]['ethai'];

    // for (int i = 0; i < dataA.length; i++) {
    //   suggestions.add(dataA[i]['esearch']);
    // }
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
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Padding(
            padding: const EdgeInsets.only(left: 200),
          ),
        ),
        body: Column(
          children: [
            Card(
              child: Row(
                children: [
                  Column(
                    children: [
                      Text(eng),
                      IconButton(
                          icon: Icon(Icons.volume_up),
                          onPressed: () {
                            _speakeng();
                          })
                    ],
                  ),
                  Spacer(),
                  IconButton(
                      icon: Icon(Icons.content_copy),
                      onPressed: () {
                        _copytxteng();
                      }),
                  IconButton(
                      icon: Icon(
                          isSaved ? Icons.favorite : Icons.favorite_border),
                      onPressed: null)
                ],
              ),
            ),
            Card(
              child: Row(
                children: [
                  Column(
                    children: [
                      Text(th),
                      IconButton(
                          icon: Icon(Icons.volume_up),
                          onPressed: () {
                            _speakTH();
                          })
                    ],
                  ),
                  Spacer(),
                  IconButton(
                      icon: Icon(Icons.content_copy),
                      onPressed: () {
                        _copytxteng();
                      }),
                ],
              ),
            ),
            Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('More interpretation'),
                  Text(ecat + " " + ethai),
                ],
              ),
            ),
            Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('More synonyms'),
                  Text(ecat + " " + esyn),
                ],
              ),
            ),
          ],
        ));
  }
}
