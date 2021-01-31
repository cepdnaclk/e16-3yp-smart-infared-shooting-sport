import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:xtag_demo/Model/match.dart';

class MatchStartedMsg extends StatelessWidget {
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
        bool started = matchdata['isStart'];
        print(started);
        String massage = 'Wait Until the Host Start';
        if (started) {
          massage = 'Batttle Begin';
        }
        ;
        //String massage = 'Wait ';
        return Container(
          alignment: Alignment.center,
          color: Colors.blue[300],
          child: Text(
            '$massage',
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
        );
      },
    );
  }
}
