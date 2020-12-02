import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  bool isSaved = false;
  var his = [
    {"esearch": '', "tentry": ''}
  ];

  getfaver() async {
    SharedPreferences history = await SharedPreferences.getInstance();
    var info = history.getString('his');
    var into = jsonDecode(info);
    setState(() {
      for (int i = 0; i < into.length - 1; i++) {
        his[i]['esearch'] = into[i]['esearch'];
        his[i]['tentry'] = into[i]['tentry'];
        his.add({});
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getfaver();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(216, 236, 228, 5),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipOval(
              child: Material(
                color: Colors.blue[800], // button color
                child: InkWell(
                  child: SizedBox(
                      width: 36,
                      height: 36,
                      child: Icon(
                        Icons.history,
                        size: 30,
                        color: Colors.white,
                      )),
                ),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              'HISTORY',
              style: TextStyle(color: Colors.black, fontSize: 25),
            ),
          ],
        ),
        elevation: 0,
        backgroundColor: Color.fromRGBO(230, 236, 228, 50),
      ),
      body: Column(
        children: [
          Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 22, top: 30),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("asset/images/bg2.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Container(
                    height: 580,
                    width: 420,
                    child: ListView.builder(
                        itemCount: his.length-1,
                        itemBuilder: (context,int index) {
                          return SingleChildScrollView(
                              child: Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                    height: 50,
                                  ),
                                  Container(
                                    height: 30,
                                    width: 125,
                                    child: ListView(
                                      scrollDirection: Axis.horizontal,
                                      children: [
                                        Container(
                                          child: Text(
                                            his[index]['esearch'],
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                    height: 50,
                                  ),
                                  Container(
                                    height: 29,
                                    width: 230,
                                    child: ListView(
                                      scrollDirection: Axis.horizontal,
                                      children: [
                                        Container(
                                          child: Text(
                                             his[index]['tentry'],
                                            style: TextStyle(
                                              fontSize: 20,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ));
                        },
                      ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
