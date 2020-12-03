import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:miniprojectdic/favorite.dart';
import 'package:miniprojectdic/fontsize.dart';
import 'package:miniprojectdic/history.dart';

class Settingdictionary extends StatefulWidget {
  @override
  _SettingdictionaryState createState() => _SettingdictionaryState();
}

class _SettingdictionaryState extends State<Settingdictionary> {
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
                            onTap: () {Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => History()));},
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
                            onTap: () {Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Favorite()));},
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
          SizedBox(
            height: 60,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: 400,
            decoration: new BoxDecoration(
                borderRadius: new BorderRadius.circular(20),
                color: Colors.white),
            height: 500,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text("Contact us",style: TextStyle(fontSize: 30),),
                ),
                Text("6131302005@lamduan.mfu.ac.th"),
                Text("6131302010@lamduan.mfu.ac.th"),
                Text("6131301016@lamduan.mfu.ac.th"),
                Text("5931301063@lamduan.mfu.ac.th"),
                Text('6131301020@lamduan.mfu.ac.th')
              ],
            ),
          ),
        ],
      ),
    );
  }
}
