import 'package:flutter/material.dart';

class Language extends StatefulWidget {
  @override
  _LanguageState createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
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
                color: Colors.blue[400], // button color
                child: InkWell(
                  child: SizedBox(
                      width: 36,
                      height: 36,
                      child: Icon(
                        Icons.language,
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
              'LANGUAGE',
              style: TextStyle(color: Colors.black, fontSize: 25),
            ),
          ],
        ),
        elevation: 0,
        backgroundColor: Color.fromRGBO(230, 236, 228, 50),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 60,
          ),
          ClipOval(
            child: Material(
              color: Color.fromRGBO(244, 244, 204, 50), // button color
              child: InkWell(
                child: SizedBox(
                    width: 186,
                    height: 186,
                    child: Image.asset(
                      'asset/images/logo.png',
                      fit: BoxFit.contain,
                    )),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  ClipOval(
                    child: Material(
                      color: Color.fromRGBO(244, 244, 204, 50), // button color
                      child: InkWell(
                        child: SizedBox(
                            width: 120,
                            height: 120,
                            child: Image.asset(
                              'asset/images/english.png',
                              fit: BoxFit.fitWidth,
                            )),
                        onTap: () {},
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'ENGLISH',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  )
                ],
              ),
              SizedBox(
                width: 80,
              ),
              Column(
                children: [
                  ClipOval(
                    child: Material(
                      color: Color.fromRGBO(244, 244, 204, 50), // button color
                      child: InkWell(
                        child: SizedBox(
                            width: 120,
                            height: 120,
                            child: Image.asset(
                              'asset/images/thai.png',
                              fit: BoxFit.fitWidth,
                            )),
                        onTap: () {},
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'ภาษาไทย',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
