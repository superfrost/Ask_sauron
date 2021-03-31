import 'dart:math';

import 'package:flutter/material.dart';
// import 'package:flutter_sound/flutter_sound.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Get know your fate',
            style: TextStyle(fontFamily: 'Ringbearer'),
          ),
          backgroundColor: Colors.red[900],
          actions: [
            MyButton(),
          ],
        ),
        backgroundColor: Colors.black,
        body: SafeArea(
          child: HomePage(),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          'assets/images/bg.jpg',
          fit: BoxFit.cover,
        ),
        Column(
          children: [
            Text(
              'Ask Sauron!',
              style: TextStyle(fontFamily: 'Ringbearer', fontSize: 32),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RandomAnswer(),
          ],
        ),
      ],
    );
  }
}

class RandomAnswer extends StatefulWidget {
  @override
  _RandomAnswerState createState() => _RandomAnswerState();
}

class _RandomAnswerState extends State<RandomAnswer> {
  String answer = 'Tap here';
  void genRandomAnswer() {
    Random random = Random();
    int randomInt = random.nextInt(6);
    switch (randomInt) {
      case 0:
        answer = 'Yes';
        break;
      case 1:
        answer = 'No';
        break;
      case 2:
        answer = '42';
        break;
      case 3:
        answer = 'Maybe';
        break;
      case 4:
        answer = 'Left';
        break;
      case 5:
        answer = 'Right';
        break;
      default:
        answer = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: TextButton(
        style: ButtonStyle(overlayColor: MaterialStateProperty.all(Color(0x20ff0000))),
        onPressed: () {
          genRandomAnswer();
          setState((){});
        },
        child: Text(
          answer,
          softWrap: true,
          style: TextStyle(
              fontFamily: 'Ringbearer', fontSize: 60, color: Colors.white),
        ),
      ),
    );
  }
}

class MyButton extends StatefulWidget {
  MyButton({Key key}) : super(key: key);
  @override
  _MyButtonState createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  final assetsAudioPlayer = AssetsAudioPlayer();

  void play() async {
    assetsAudioPlayer.open(Audio("assets/sounds/background.mp3"),
        loopMode: LoopMode.single);
    setState(() {});
  }

  void stop() {
    assetsAudioPlayer.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            play();
          },
          icon: Icon(Icons.play_arrow),
        ),
        IconButton(
          onPressed: () {
            stop();
          },
          icon: Icon(Icons.stop),
        ),
      ],
    );
  }
}

// Container(
//       width: MediaQuery.of(context).size.width,
//       height: MediaQuery.of(context).size.height,
//       decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/bg.jpg'), fit: BoxFit.cover,)),
//       child: Text('Hi mom'),
//     );
