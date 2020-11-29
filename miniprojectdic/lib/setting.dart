import 'package:flutter/material.dart';
import 'package:miniprojectdic/favorite.dart';
import 'package:miniprojectdic/fontsize.dart';

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
          SizedBox(height: 60,),
          Container(
            width: 400,
            height: 80,
            child: RaisedButton(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              onPressed: () {},
              child: Text(
                'ENGLISH / ภาษาไทย',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          SizedBox(height: 10,),
          Container(
            width: 400,
            height: 80,
            child: RaisedButton(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              onPressed: () {},
              child: Text(
                'Contact us',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
