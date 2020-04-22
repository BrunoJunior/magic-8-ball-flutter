import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shake_event/shake_event.dart';

void main() => runApp(
      MaterialApp(
        home: BallPage(),
      ),
    );

class BallPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text('Ask Me Anything'),
        backgroundColor: Colors.blue[900],
      ),
      body: Ball(),
    );
  }
}

class Ball extends StatefulWidget {
  @override
  _BallState createState() => _BallState();
}

class _BallState extends State<Ball> with ShakeHandler {
  int response;
  _BallState() {
    changeResponse();
  }

  /// Change the response
  void changeResponse() => response = 1 + Random().nextInt(5);

  @override
  void dispose() {
    resetShakeListeners();
    super.dispose();
  }

  @override
  shakeEventListener() {
    setState(changeResponse);
  }

  @override
  Widget build(BuildContext context) {
    startListeningShake(30.0);
    return Center(
      child: FlatButton(
        onPressed: shakeEventListener,
        child: Image.asset(
          'images/ball$response.png',
        ),
      ),
    );
  }
}
