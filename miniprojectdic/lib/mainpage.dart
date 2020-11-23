import 'package:flutter/material.dart';

class Mainpagedictionary extends StatefulWidget {
  @override
  _MainpagedictionaryState createState() => _MainpagedictionaryState();
}

class _MainpagedictionaryState extends State<Mainpagedictionary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Title'),
        bottom: TabBar(tabs:[Tab(icon: Icon(Icons.home),text: "home",),Tab(icon: Icon(Icons.home),text: "home",)]),
      ),
      body: Container(),

    );
  }
}
