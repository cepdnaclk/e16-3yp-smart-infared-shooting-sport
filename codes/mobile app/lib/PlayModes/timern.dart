import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:xtag_demo/Model/match.dart';
import 'package:xtag_demo/Model/player1.dart';
import 'package:xtag_demo/PlayModes/timeompj.dart';
import 'package:xtag_demo/PlayModes/timerimp.dart';
import 'package:xtag_demo/Services/blue.dart';
import 'package:xtag_demo/Services/database.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class TimernJ extends StatefulWidget {
  @override
  _TimernJState createState() => _TimernJState();
}

final CollectionReference matchCollection =
    FirebaseFirestore.instance.collection("match");
int _gunNumber = Player1.gun;
int _teamNumber = Player1.team;

class _TimernJState extends State<TimernJ> {
  bool isStarted = false;
  // Future<bool> _onFat;
  //FutureOr<bool> get name => null;

  Stream<bool> onfat() async* {
    //bool name;
    while (Match.started != true) {
      await Future.delayed(Duration(seconds: 2));
      yield await FirebaseFirestore.instance
          .collection('match')
          .doc(Match.mid)
          .get()
          .then((DocumentSnapshot documentSnapshot) async {
        //print("Vira0");
        //print(documentSnapshot['name']);
        bool name = documentSnapshot['isStart'];
        print('print isStart from database $name');
        //return Future<bool>.value(true);
        Match.started = name;
        if (Match.started == true) {
          await matchCollection
              .doc(Match.mid)
              .collection('players')
              .doc(Player1.uid)
              .get()
              .then((DocumentSnapshot documentSnapshot) async {
            Player1.tempid = documentSnapshot['tempid'];
            String temp;
            String tempid;
            if (Player1.tempid < 10) {
              tempid = "0${Player1.tempid}";
              temp = "T$_teamNumber$_gunNumber$tempid";
            } else {
              tempid = "${Player1.tempid}";
              temp = "T$_teamNumber$_gunNumber$tempid";
            }
            print("Data :$temp");
            try {
              await BluetoothServices().write(temp);
            } catch (e) {
              print(e.toString());
            }
            String kill = "K0";
            try {
              await BluetoothServices().write(kill);
            } catch (e) {
              print(e.toString());
            }
            return name;
          });
        }
        return name;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    // _onFat = onfat();
  }

  Widget build(BuildContext context) {
    //bool val = Match.started;
    CountDownController _controller = CountDownController();
    print("Print is Start in lsast $isStarted");
    return Container(
        margin: const EdgeInsets.only(top: 5, right: 5.0, left: 10.0),
        color: Colors.black,
        child: StreamBuilder<bool>(
            stream: onfat(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data == true) {
                  return TimerImpJ();
                } else {
                  return Container(
                    alignment: Alignment.center,
                    color: Colors.blue[300],
                    child: Text(
                      'Wait unti host start',
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                  );
                }
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
              return Container(
                alignment: Alignment.center,
                color: Colors.blue[300],
                child: Text(
                  'Wait unti host start',
                  style: TextStyle(fontSize: 15, color: Colors.black),
                ),
              );
            }));
  }
}
