import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:xtag_demo/Model/match.dart';
import 'package:xtag_demo/Model/player1.dart';

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
        String msg = matchdata['msg'];
        int currentcode = matchdata['currentcode'];
        print(started);
        String massage = 'Wait Until the Host Start';
        if (currentcode == null) {
          if (started) {
            msg = matchdata['msg'];
          } else {
            msg = 'Wait Until host start the battle';
          }
        } else {
          if (currentcode == Player1.rescode) {
            msg = 'You are killed';
          } else {
            int teamn = currentcode ~/ 1000000;
            if (teamn == Player1.team) {
              msg = msg = matchdata['msg'];
            } else {
              msg = 'Battle happening';
            }
          }
        }

        //String massage = 'Wait ';
        return Container(
          alignment: Alignment.center,
          color: Colors.blue[300],
          child: Column(
            children: [
              Text(
                '$msg , ',
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
              Text(
                '$msg , ',
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
            ],
          ),
        );
      },
    );
  }
}
