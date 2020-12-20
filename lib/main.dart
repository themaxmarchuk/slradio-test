import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:just_audio/just_audio.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      theme: ThemeData.dark(),
      home: Scaffold(
        body: Center(child: Player()),
      ),
    );
  }
}

class Player extends StatelessWidget {
  final player = AudioPlayer();

  void togglePlayer() {
    if (player.playing) {
      player.pause();
    } else {
      player.play();
    }
  }

  @override
  Widget build(BuildContext context) {
    player.setUrl('http://stream.radiojar.com/de1wc765sd0uv');
    return Container(
        width: 300,
        child: Center(
            child: Column(
          children: [
            Text(
              'SL Radio Player',
              style: TextStyle(fontSize: 30),
            ),
            Text(
              'Song Name Would Go Here.',
              style: TextStyle(fontSize: 15, color: Colors.white70),
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(10, 40, 10, 25),
                child: Image(
                    height: 200,
                    width: 200,
                    image: NetworkImage(
                        'https://images.unsplash.com/photo-1511671782779-c97d3d27a1d4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&height=500&q=80'))),
            IconButton(
                icon: Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                ),
                alignment: Alignment.center,
                iconSize: 50,
                onPressed: togglePlayer)
          ],
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
        )));
  }
}
