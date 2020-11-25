import 'package:flutter/material.dart';

class Fontsize extends StatefulWidget {
  @override
  _FontsizeState createState() => _FontsizeState();
}

class _FontsizeState extends State<Fontsize> {
  double _value = 5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Font Size')),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Icon(Icons.text_rotation_none),
                  ),
                  Container(
                    width: 350,
                    decoration: new BoxDecoration(
                        color: Colors.blue[400],
                        borderRadius:
                            new BorderRadius.all(new Radius.circular(5.0)),
                        boxShadow: [
                          new BoxShadow(
                              color: Colors.black38,
                              offset: new Offset(0.0, 2.0),
                              blurRadius: 10)
                        ]),
                    child: new Slider(
                      value: _value,
                      activeColor: Colors.white,
                      inactiveColor: Colors.white,
                      onChanged: (double s) {
                        setState(() {
                          _value = s;
                        });
                      },
                      divisions: 10,
                      min: 0.0,
                      max: 10.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Icon(
                      Icons.text_rotation_none,
                      size: 40,
                    ),
                  ),
                ],
              ),
              Text("Hello World", style: TextStyle(fontSize: 10 * _value)),
            ],
          ),
        ),
      ),
    );
  }
}
