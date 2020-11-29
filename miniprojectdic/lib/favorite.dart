import 'package:flutter/material.dart';

class Favorite extends StatefulWidget {
  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  bool isSaved = false;
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
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Row(
                              //Row ของคอลัมตัวอักษรอังกฤษกับไทย
                              children: [
                                Row(
                                  //คอลัมอังกฤษ
                                  children: [
                                    SizedBox(
                                      width: 50,
                                      height: 50,
                                    ),
                                    Container(
                                      height: 30,
                                      width: 80,
                                      child: ListView(
                                        scrollDirection: Axis.horizontal,
                                        children: [
                                          Container(
                                            child: Text(
                                              'apple melmon',
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  //คอลัมไทย
                                  children: [
                                    SizedBox(
                                      width: 50,
                                      height: 50,
                                    ),
                                    Container(
                                      height: 29,
                                      width: 200,
                                      child: ListView(
                                        scrollDirection: Axis.horizontal,
                                        children: [
                                          Container(
                                            child: Text(
                                              'แอปเปิ้ล มะนาว กล้วย ส้ม',
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
                            ),
                            Row(
                              //Row ของคอลัมตัวอักษรอังกฤษกับไทย
                              children: [
                                Row(
                                  //คอลัมอังกฤษ
                                  children: [
                                    SizedBox(
                                      width: 50,
                                      height: 50,
                                    ),
                                    Container(
                                      height: 30,
                                      width: 80,
                                      child: ListView(
                                        scrollDirection: Axis.horizontal,
                                        children: [
                                          Container(
                                            child: Text(
                                              'apple melmon',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  //คอลัมไทย
                                  children: [
                                    SizedBox(
                                      width: 50,
                                      height: 50,
                                    ),
                                    Container(
                                      height: 29,
                                      width: 200,
                                      child: ListView(
                                        scrollDirection: Axis.horizontal,
                                        children: [
                                          Container(
                                            child: Text(
                                              'แอปเปิ้ล มะนาว กล้วย ส้ม',
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
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Image.asset(
                    //   'asset/images/bg3.png',
                    //   height: 700,
                    //   width: 400,
                    // ),
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
