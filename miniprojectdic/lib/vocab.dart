import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Vocab extends StatefulWidget {
  @override
  _VocabState createState() => _VocabState();
}

class _VocabState extends State<Vocab> {
  final FlutterTts flutterTts = FlutterTts();
  bool isSaved = false;

  Future _speakeng() async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1);
    print(await flutterTts.getVoices);
    await flutterTts.speak('Reliable');
  }

  Future _speakTH() async {
    await flutterTts.setLanguage("th-TH");
    await flutterTts.setPitch(1);
    print(await flutterTts.getVoices);
    await flutterTts.speak('เชื่อถือได้');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(left: 200),
        ),
      ),
      body: Container(
        color: Colors.grey[200],
        child: Column(
          children: [
            Container(
              color: Colors.white,
              width: 500,
              height: 150,
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Row(
                  children: [
                    Spacer(),
                    Column(
                      children: [
                        Text(
                          'Reliable',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: Row(
                            children: [
                              Text('[ADJ]'),
                              IconButton(
                                icon: Icon(
                                  Icons.volume_up,
                                  color: Colors.blue,
                                ),
                                onPressed: () => _speakeng(),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Spacer(
                      flex: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 100, right: 5),
                      child: Text('Favorite'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 100),
                      child: GestureDetector(
                        child: Icon(
                            isSaved ? Icons.favorite : Icons.favorite_border,
                            color: isSaved ? Colors.pinkAccent : null),
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
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
            Spacer(),
            Container(
              color: Colors.white,
              width: 500,
              height: 120,
              child: Padding(
                padding: const EdgeInsets.only(top: 35),
                child: Row(
                  children: [
                    Spacer(),
                    Column(
                      children: [
                        Text(
                          'เชื่อถือได้',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30, left: 10),
                      child: IconButton(
                        icon: Icon(
                          Icons.volume_up,
                          color: Colors.blue,
                        ),
                        onPressed: () => _speakTH(),
                      ),
                    ),
                    Spacer(
                      flex: 16,
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            Container(
              color: Colors.white,
              width: 500,
              height: 150,
              child: Padding(
                padding: const EdgeInsets.only(right: 200, top: 30),
                child: Column(
                  children: [
                    Text(
                      'More interpretation',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 80),
                      child: Text(
                        'adj. ไว้ใจได้',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 70),
                      child: Text(
                        'adj. วางใจได้',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            Container(
              color: Colors.white,
              width: 500,
              height: 335,
              child: Padding(
                padding: const EdgeInsets.only(right: 230, top: 30),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        'More synonyms',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: Row(
                        children: [
                          Text(
                            'dependable วางใจได้',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: Text(
                        'trustworthy เชื่อใจได้',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Spacer(
              flex: 4,
            ),
          ],
        ),
      ),
    );
  }
}
