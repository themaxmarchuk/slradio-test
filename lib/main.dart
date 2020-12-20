import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_radio_player/flutter_radio_player.dart';

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
  final FlutterRadioPlayer player = new FlutterRadioPlayer();

  Player() {
    player.init("Slavic Life Radio", "Subtitle Song Name",
        "http://stream.radiojar.com/de1wc765sd0uv", "false");
  }

  void dispose() {
    player.stop();
  }

  @override
  Widget build(BuildContext context) {
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
                onPressed: player.playOrPause)
          ],
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
        )));
  }
}
