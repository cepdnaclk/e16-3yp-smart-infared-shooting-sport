import 'dart:async';
import 'package:xtag_demo/Model/match.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';

class TimerCounter extends StatefulWidget {
  @override
  _TimerCounterState createState() => _TimerCounterState();
}

class _TimerCounterState extends State<TimerCounter> {
  DateTime _timeuntil;
  Timer _timer;
  int _start = 120;
  bool started = false;
  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_start < 1) {
          timer.cancel();
        } else {
          //print(_start);
          _start = _start - 1;
        }
      });
    });
  }

  void disposal() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!Match.started) {
      return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('match')
            .doc(Match.mid)
            .snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (!snapshot.hasData) return Text('Loading');
          var matchdata = snapshot.data;
          bool started = matchdata['isStart'];
          // print(started)
          //String massage = 'Wait ';
          return Container(
            alignment: Alignment.center,
            color: Colors.yellow[300],
            child: Text(
              "hjjjjj",
              style: TextStyle(fontSize: 15, color: Colors.black),
            ),
          );
        },
      );
    } else {
      //print(Match.duration);
      //startTimer();
      return Container(
        alignment: Alignment.center,
        color: Colors.yellow[300],
        child: Text(
          "hhhh",
          style: TextStyle(fontSize: 15, color: Colors.black),
        ),
      );
    }
  }
}
