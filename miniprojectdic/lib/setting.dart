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
      body: Container(
        color: Colors.grey[200],
        child: Column(
          children: [
            Container(
              color: Colors.lightBlue,
              width: 500,
              height: 100,
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Center(
                  child: Text(
                    'Setting',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Container(
              width: 500,
              height: 70,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Text(
                      'Language',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    IconButton(
                        icon: Icon(Icons.arrow_forward_ios), onPressed: () {}),
                  ],
                ),
              ),
            ),
            Spacer(),
            Container(
              width: 500,
              height: 70,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Text(
                      'Font Size',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    IconButton(
                        icon: Icon(Icons.arrow_forward_ios),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Fontsize(),
                            ),
                          );
                        }),
                  ],
                ),
              ),
            ),
            Spacer(),
            Container(
              width: 500,
              height: 70,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Text(
                      'Favorite',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                     IconButton(
                        icon: Icon(Icons.arrow_forward_ios),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Favorite(),
                            ),
                          );
                        }),
                  ],
                ),
              ),
            ),
            Spacer(
              flex: 190,
            ),
          ],
        ),
      ),
    );
  }
}
