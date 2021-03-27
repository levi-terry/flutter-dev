import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(XylophoneApp());
}

class XylophoneApp extends StatelessWidget {
  final AudioCache playerCache = AudioCache();

  void _playSound(int num) {
    playerCache.play("note$num.wav");
  }

  Expanded _buildKey(Color color, int num) {
    return Expanded(
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: color,
        ),
        onPressed: () {
          _playSound(num);
        },
        child: SizedBox(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Xylophone',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _buildKey(Colors.red, 1),
                _buildKey(Colors.orange, 2),
                _buildKey(Colors.yellow, 3),
                _buildKey(Colors.green, 4),
                _buildKey(Colors.blue, 5),
                _buildKey(Colors.indigo, 6),
                _buildKey(Colors.deepPurple, 7),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
