import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lightGreen,
        body: SafeArea(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  foregroundImage: AssetImage("images/headshot.jpg"),
                  radius: 100,
                ),
                Stack(children: <Widget>[
                  Text(
                    "Levi Terry",
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      fontFamily: "PinyonScript",
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 2
                        ..color = Colors.black,
                    ),
                  ),
                  Text(
                    "Levi Terry",
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      fontFamily: "PinyonScript",
                      color: Colors.white,
                    ),
                  ),
                ]),
                Text(
                  "SOFTWARE ENGINEER",
                  style: TextStyle(
                    fontSize: 22,
                    letterSpacing: 2,
                    fontWeight: FontWeight.bold,
                    fontFamily: "SourceSansPro",
                    color: Colors.lightGreen.shade100,
                  ),
                ),
                SizedBox(
                  height: 20,
                  width: 200,
                  child: Divider(
                    color: Colors.lightGreen.shade900,
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
                  child: Padding(
                    padding: const EdgeInsets.all(2),
                    child: ListTile(
                        leading: Icon(
                          Icons.phone,
                          color: Colors.lightGreen.shade900,
                        ),
                        trailing: Text(
                          "+1 (234) 567-8901",
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: "SourceSansPro",
                            color: Colors.lightGreen.shade900,
                          ),
                        )),
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
                  child: Padding(
                    padding: const EdgeInsets.all(2),
                    child: ListTile(
                        leading: Icon(
                          Icons.email,
                          color: Colors.lightGreen.shade900,
                        ),
                        trailing: Text(
                          "email_here@gmail.com",
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: "SourceSansPro",
                            color: Colors.lightGreen.shade900,
                          ),
                        )),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
