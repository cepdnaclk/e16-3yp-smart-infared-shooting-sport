import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:xtag_demo/Model/match.dart';
import 'package:xtag_demo/Model/player1.dart';

class MatchStartedMsg extends StatelessWidget {
  int count1 = 1;
  int number1;
  var codein;
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
        String mode = matchdata['mode'];
        print(started);
        String massage = 'Wait Until the Host Start';
        if (currentcode == null && mode != 'r3') {
          if (started) {
            msg = matchdata['msg'];
            return Container(
              alignment: Alignment.center,
              color: Colors.blue[300],
              child: Column(
                children: [
                  Text(
                    '$msg , ',
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                ],
              ),
            );
          } else {
            msg = 'Wait Until host start the battle';
            return Container(
              alignment: Alignment.center,
              color: Colors.blue[300],
              child: Column(
                children: [
                  Text(
                    '$msg , ',
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                ],
              ),
            );
          }
        } else {
          if (currentcode == Player1.rescode && currentcode != null) {
            msg = 'You are killed';
            return Container(
              child: Column(
                children: [
                  Container(
                    width: 100.0,
                    height: 20.0,
                    color: Colors.blue[300],
                    child: TextFormField(
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                      ),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(hintText: 'Rescue Code'),
                      validator: (val) =>
                          val.isEmpty ? 'Enter an Match ID' : null,
                      onChanged: (val) {
                        codein = int.parse(val);
                      },
                    ),
                  ),
                  RaisedButton(
                      color: Colors.green[400],
                      elevation: 10.0,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.deepPurple[900],
                          ),
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Text(
                        ' Rascue ',
                        style: TextStyle(fontSize: 12.0),
                      ),
                      onPressed: () async {
                        Player1.inputresc = codein;
                      })
                ],
              ),
            );
          } else {
            if (currentcode != null) {
              int teamn = (currentcode / 1000000).floor();
              if (teamn == Player1.team) {
                msg = 'Battle Happening';
                return Container(
                  alignment: Alignment.center,
                  color: Colors.blue[300],
                  child: Column(
                    children: [
                      Text(
                        '$msg , ',
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                    ],
                  ),
                );
              } else {
                msg = 'Battle happening';
                return Container(
                  alignment: Alignment.center,
                  color: Colors.blue[300],
                  child: Column(
                    children: [
                      Text(
                        '$msg , ',
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                    ],
                  ),
                );
              }
            } else {
              if (started) {
                msg = matchdata['msg'];
                return Container(
                  alignment: Alignment.center,
                  color: Colors.blue[300],
                  child: Column(
                    children: [
                      Text(
                        '$msg , ',
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                    ],
                  ),
                );
              } else {
                msg = 'Wait Until host start the battle';
                return Container(
                  alignment: Alignment.center,
                  color: Colors.blue[300],
                  child: Column(
                    children: [
                      Text(
                        '$msg , ',
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                    ],
                  ),
                );
              }
            }
          }
        }

        //String massage = 'Wait ';
      },
    );
  }
}
