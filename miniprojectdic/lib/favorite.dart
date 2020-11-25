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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 50, left: 40, bottom: 20),
                    child: Text(
                      'Favorite',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40, left: 210),
                    child: FlatButton(
                      onPressed: () {},
                      child: Icon(
                        Icons.delete,
                        size: 20,
                        color: Colors.white,
                      ),
                      color: Colors.blue[400],
                      shape: CircleBorder(
                        side: BorderSide(
                          color: Colors.blue[400],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0),
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
                            Spacer(
                              flex: 2,
                            ),
                            GestureDetector(
                              child: Icon(
                                  isSaved ? Icons.star : Icons.star_border,
                                  color: isSaved ? Colors.yellow[800] : null),
                              onTap: () {
                                setState(() {
                                  if (isSaved == false) {
                                    isSaved = true;
                                  } else {
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
