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
            return Row(
              children: [
                Container(
                  margin:
                      const EdgeInsets.only(top: 5.0, right: 20.0, left: 20.0),
                  color: Colors.white60,
                  child: TextFormField(
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17.0,
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
                    color: Colors.blueAccent[400],
                    elevation: 10.0,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.deepPurple[900],
                        ),
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Text(
                      ' submit ',
                      style: TextStyle(fontSize: 17.0),
                    ),
                    onPressed: () async {
                      Player1.inputresc = codein;
                    })
              ],
            );
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
