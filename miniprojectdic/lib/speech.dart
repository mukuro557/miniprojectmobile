import 'package:flutter/material.dart';

class Speech extends StatefulWidget {
  @override
  _SpeechState createState() => _SpeechState();
}

class _SpeechState extends State<Speech> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(left: 190),
          child: Text(
            'Speech',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              Spacer(flex: 2,),
              Text(
                'Reliable',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              Icon(
                Icons.swap_vert,
                size: 40,
                color: Colors.grey[400],
              ),
              Spacer(),
              Text(
                'น่าเชื่อถือ',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(flex: 2,),
              RawMaterialButton(
                onPressed: () {},
                elevation: 2.0,
                fillColor: Colors.white,
                child: Icon(
                  Icons.mic,
                  size: 35.0,
                ),
                padding: EdgeInsets.all(15.0),
                shape: CircleBorder(),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
