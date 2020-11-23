import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';

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
      ),
      body: Container(),
      bottomNavigationBar: Container(
        color: Colors.red,
        child: TabBar(
          tabs[Tab(
            icon: Icons.red,
            text: "text",
          )],
        ),
      ),
    );
  }
}
