import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Favorite extends StatefulWidget {
  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  bool isSaved = false;
  var fav = [
    {"esearch": '', "tentry": ''}
  ];

  getfaver() async {
    SharedPreferences favorite = await SharedPreferences.getInstance();
    var info = favorite.getString('fav');
    var into = jsonDecode(info);
    setState(() {
       for (int i = 0; i < into.length-1; i++) {
      fav[i]['esearch'] = into[i]['esearch'];
      fav[i]['tentry'] = into[i]['tentry'];
      fav.add({});
    }
    });
   
    print(fav);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getfaver();
  }

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
                color: Colors.blue[500], // button color
                child: InkWell(
                  child: SizedBox(
                      width: 36,
                      height: 36,
                      child: Icon(
                        Icons.star,
                        size: 30,
                        color: Colors.yellow,
                      )),
                ),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              'FAVORITE',
              style: TextStyle(color: Colors.black, fontSize: 25),
            ),
          ],
        ),
        elevation: 0,
        backgroundColor: Color.fromRGBO(230, 236, 228, 50),
      ),
      body: Column(
        children: [
          Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 22, top: 30),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("asset/images/bg3.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Container(
                    height: 580,
                    width: 420,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: ListView.builder(
                        itemCount: fav.length-1,
                        itemBuilder: (context,int index) {
                          return SingleChildScrollView(
                              child: Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                    height: 50,
                                  ),
                                  Container(
                                    height: 30,
                                    width: 125,
                                    child: ListView(
                                      scrollDirection: Axis.horizontal,
                                      children: [
                                        Container(
                                          child: Text(
                                            fav[index]['esearch'],
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                    height: 50,
                                  ),
                                  Container(
                                    height: 29,
                                    width: 230,
                                    child: ListView(
                                      scrollDirection: Axis.horizontal,
                                      children: [
                                        Container(
                                          child: Text(
                                             fav[index]['tentry'],
                                            style: TextStyle(
                                              fontSize: 20,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ));
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
