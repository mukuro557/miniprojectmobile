import 'package:flutter/material.dart';

class GameDemo extends StatefulWidget {
  @override
  _GameDemoState createState() => _GameDemoState();
}

class _GameDemoState extends State<GameDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Game'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
      Text("data"),
      Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Spacer(),
            RaisedButton(
              onPressed: null,
              child: Text('data'),
            ),Spacer(), RaisedButton(
              onPressed: null,
              child: Text('data'),
            ),Spacer(),
          ],
        ),
      ),
        ],
      ),
    );
  }
}
