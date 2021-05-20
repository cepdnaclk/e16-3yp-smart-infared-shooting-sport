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
            String tempID;
            String tempTeam;
            String tempDam;
            if (_teamNumber == 0) {
              tempTeam = 'A';
            } else if (_teamNumber == 1) {
              tempTeam = 'B';
            } else if (_teamNumber == 2) {
              tempTeam = 'C';
            } else if (_teamNumber == 3) {
              tempTeam = 'D';
            }
            try {
              await BluetoothServices().write(tempTeam);
            } catch (e) {
              print(e.toString());
            }
            if (_gunNumber == 0) {
              tempTeam = 'E';
            } else if (_gunNumber == 1) {
              tempTeam = 'F';
            } else if (_gunNumber == 2) {
              tempTeam = 'G';
            } else if (_gunNumber == 3) {
              tempTeam = 'H';
            }
            try {
              await BluetoothServices().write(tempDam);
            } catch (e) {
              print(e.toString());
            }

            if (Player1.tempid == 0) {
              tempID = 'I';
            } else if (Player1.tempid == 1) {
              tempID = 'J';
            } else if (Player1.tempid == 3) {
              tempID = 'K';
            } else if (Player1.tempid == 3) {
              tempID = 'L';
            } else if (Player1.tempid == 4) {
              tempID = 'M';
            } else if (Player1.tempid == 5) {
              tempID = 'N';
            } else if (Player1.tempid == 6) {
              tempID = 'O';
            } else if (Player1.tempid == 7) {
              tempID = 'P';
            } else if (Player1.tempid == 8) {
              tempID = 'Q';
            } else if (Player1.tempid == 9) {
              tempID = 'R';
            } else if (Player1.tempid == 10) {
              tempID = 'S';
            } else if (Player1.tempid == 11) {
              tempID = 'T';
            } else if (Player1.tempid == 12) {
              tempID = 'U';
            } else if (Player1.tempid == 13) {
              tempID = 'V';
            } else if (Player1.tempid == 14) {
              tempID = 'W';
            } else if (Player1.tempid == 15) {
              tempID = 'X';
            }
            try {
              await BluetoothServices().write(tempID);
            } catch (e) {
              print(e.toString());
            }
            try {
              await BluetoothServices().write("a");
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
