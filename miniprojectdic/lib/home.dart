import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool isSaved = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 45, bottom: 20),
                child: Text(
                  'Home',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Column(
                  children: [
                    Container(
                        height: 100,
                        width: 400,
                        margin: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.blue[50],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          children: [
                            Spacer(),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 205, top: 15, bottom: 20),
                                  child: Text(
                                    'abandon',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.lightBlue),
                                  ),
                                ),
                                Text(
                                    '[VT]ทิ้ง, ทอดทิ้ง, ละทิ้ง, ทิ้งขว้าง, ผละ, จากไป')
                              ],
                            ),
                            Spacer(),
                            GestureDetector(
                              child: Icon(
                                  isSaved ? Icons.star : Icons.star_border,
                                  color: isSaved ? Colors.yellow[800] : null),
                              onTap: () {
                                setState(() {
                                  if (isSaved==false) {
                                    isSaved = true;
                                  }else{
                                     isSaved = false;
                                  }
                                });
                              },
                            ),
                            Spacer(),
                          ],
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Column(
                  children: [
                    Container(
                        height: 100,
                        width: 400,
                        margin: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.blue[50],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          children: [
                            Spacer(),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 205, top: 15, bottom: 20),
                                  child: Text(
                                    'abandon',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.lightBlue),
                                  ),
                                ),
                                Text(
                                    '[VT]ทิ้ง, ทอดทิ้ง, ละทิ้ง, ทิ้งขว้าง, ผละ, จากไป')
                              ],
                            ),
                            Spacer(),
                            GestureDetector(
                              child: Icon(
                                  isSaved ? Icons.star : Icons.star_border,
                                  color: isSaved ? Colors.yellow[800] : null),
                              onTap: () {
                                setState(() {
                                  if (isSaved==false) {
                                    isSaved = true;
                                  }else{
                                     isSaved = false;
                                  }
                                });
                              },
                            ),
                            Spacer(),
                          ],
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Column(
                  children: [
                    Container(
                        height: 100,
                        width: 400,
                        margin: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.blue[50],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          children: [
                            Spacer(),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 205, top: 15, bottom: 20),
                                  child: Text(
                                    'abandon',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.lightBlue),
                                  ),
                                ),
                                Text(
                                    '[VT]ทิ้ง, ทอดทิ้ง, ละทิ้ง, ทิ้งขว้าง, ผละ, จากไป')
                              ],
                            ),
                            Spacer(),
                            GestureDetector(
                              child: Icon(
                                  isSaved ? Icons.star : Icons.star_border,
                                  color: isSaved ? Colors.yellow[800] : null),
                              onTap: () {
                                setState(() {
                                  if (isSaved==false) {
                                    isSaved = true;
                                  }else{
                                     isSaved = false;
                                  }
                                });
                              },
                            ),
                            Spacer(),
                          ],
                        )),
                  ],
                ),
              ),Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Column(
                  children: [
                    Container(
                        height: 100,
                        width: 400,
                        margin: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.blue[50],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          children: [
                            Spacer(),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 205, top: 15, bottom: 20),
                                  child: Text(
                                    'abandon',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.lightBlue),
                                  ),
                                ),
                                Text(
                                    '[VT]ทิ้ง, ทอดทิ้ง, ละทิ้ง, ทิ้งขว้าง, ผละ, จากไป')
                              ],
                            ),
                            Spacer(),
                            GestureDetector(
                              child: Icon(
                                  isSaved ? Icons.star : Icons.star_border,
                                  color: isSaved ? Colors.yellow[800] : null),
                              onTap: () {
                                setState(() {
                                  if (isSaved==false) {
                                    isSaved = true;
                                  }else{
                                     isSaved = false;
                                  }
                                });
                              },
                            ),
                            Spacer(),
                          ],
                        )),
                  ],
                ),
              ),Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Column(
                  children: [
                    Container(
                        height: 100,
                        width: 400,
                        margin: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.blue[50],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          children: [
                            Spacer(),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 205, top: 15, bottom: 20),
                                  child: Text(
                                    'abandon',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.lightBlue),
                                  ),
                                ),
                                Text(
                                    '[VT]ทิ้ง, ทอดทิ้ง, ละทิ้ง, ทิ้งขว้าง, ผละ, จากไป')
                              ],
                            ),
                            Spacer(),
                            GestureDetector(
                              child: Icon(
                                  isSaved ? Icons.star : Icons.star_border,
                                  color: isSaved ? Colors.yellow[800] : null),
                              onTap: () {
                                setState(() {
                                  if (isSaved==false) {
                                    isSaved = true;
                                  }else{
                                     isSaved = false;
                                  }
                                });
                              },
                            ),
                            Spacer(),
                          ],
                        )),
                  ],
                ),
              ),Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Column(
                  children: [
                    Container(
                        height: 100,
                        width: 400,
                        margin: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.blue[50],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          children: [
                            Spacer(),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 205, top: 15, bottom: 20),
                                  child: Text(
                                    'abandon',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.lightBlue),
                                  ),
                                ),
                                Text(
                                    '[VT]ทิ้ง, ทอดทิ้ง, ละทิ้ง, ทิ้งขว้าง, ผละ, จากไป')
                              ],
                            ),
                            Spacer(),
                            GestureDetector(
                              child: Icon(
                                  isSaved ? Icons.star : Icons.star_border,
                                  color: isSaved ? Colors.yellow[800] : null),
                              onTap: () {
                                setState(() {
                                  if (isSaved==false) {
                                    isSaved = true;
                                  }else{
                                     isSaved = false;
                                  }
                                });
                              },
                            ),
                            Spacer(),
                          ],
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
