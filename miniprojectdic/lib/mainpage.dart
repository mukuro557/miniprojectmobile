import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';

class Mainpagedictionary extends StatefulWidget {
  @override
  _MainpagedictionaryState createState() => _MainpagedictionaryState();
}

class _MainpagedictionaryState extends State<Mainpagedictionary> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Tab Demo'),
        ),
        bottomNavigationBar: Container(
          color: Colors.purple,
          child: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.home),
                text: 'Home',
              ),
              Tab(
                icon: Icon(Icons.train),
                text: 'Train',
              ),
              Tab(
                icon: Icon(Icons.directions_bike),
                text: 'Bike',
              ),
            ],
          ),
        ),
        body: TabBarView(children: [
          Container(
            child: Text('Home'),
            color: Colors.yellow,
          ),
          Container(
            child: Text('Train'),
            color: Colors.green,
          ),
          Container(
            child: Text('Bike'),
            color: Colors.orange,
          ),
        ]),
      ),
    );
  }
}
