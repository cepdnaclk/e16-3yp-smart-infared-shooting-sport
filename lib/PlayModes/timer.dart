import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:xtag_demo/Model/match.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:xtag_demo/Services/database.dart';

class TimerCounter3 extends StatefulWidget {
  @override
  _TimerCounter3State createState() => _TimerCounter3State();
}

final FirebaseAuth _auth = FirebaseAuth.instance;

class _TimerCounter3State extends State<TimerCounter3> {
  Timer _timer;
  int _start = Match.duration;
  bool started = false;
  String msg = '    Start';
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
    return Column(
      children: [
        Container(
          // color: Colors.green[600],
          margin: const EdgeInsets.only(top: 10.0, right: 90.0, left: 90.0),
          width: 100.0,
          height: 30.0,
          child: FlatButton(
            color: Colors.transparent,
            /*child: Container(

                ///color: Colors.green[600],
                child: Row(
              children: [
                Text(" $msg"),
              ],
            )),*/
            onPressed: () async {
              if (!started) {
                msg = '   Started';
                startTimer();
                started = true;
                try {
                  User user = _auth.currentUser;
                  await DatabaseServices(uid: user.uid)
                      .upadtenestedmatchisready(Match.mid);
                } catch (e) {
                  print(e.toString());
                }
                //print(Match.mid);
                Match.started = true;
              }
            },
            child: null,
          ),
        ),
        SizedBox(height: 5.0),
        Container(
            color: Colors.yellow,
            margin: const EdgeInsets.only(top: 2.0, right: 100.0, left: 100.0),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.timer, size: 30.0, color: Colors.black),
                Container(
                  margin: const EdgeInsets.only(right: 5.0, left: 5.0),
                  alignment: Alignment.center,
                  child: Text(
                    ' $_start',
                    style: TextStyle(fontSize: 40, color: Colors.red[900]),
                  ),
                ),
              ],
            ))
      ],
    );
  }
}
