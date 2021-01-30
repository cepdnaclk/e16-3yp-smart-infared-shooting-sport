import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:xtag_demo/Model/match.dart';

class TimeDisplay extends StatelessWidget {
  int count1 = 1;
  int number1;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('match')
          .doc(Match.mid)
          .snapshots(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (!snapshot.hasData) return Text('Loading');
        var matchdata = snapshot.data;
        int time = matchdata['duration'];
        int sec = time % 60;
        print(sec);
        int min = (time) ~/ 60;
        print(min);
        return Container(
            margin: const EdgeInsets.only(top: 20.0, right: 100.0, left: 100.0),
            alignment: Alignment.center,
            color: Colors.yellow,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.timer, size: 30.0, color: Colors.black),
                Container(
                  margin: const EdgeInsets.only(right: 5.0, left: 5.0),
                  alignment: Alignment.center,
                  child: Text(
                    ' $min : $sec ',
                    style: TextStyle(fontSize: 40, color: Colors.red[900]),
                  ),
                ),
              ],
            ));
      },
    );
  }
}
