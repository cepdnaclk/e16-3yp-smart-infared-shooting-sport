import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:xtag_demo/Model/match.dart';
import 'creat_game.dart';

class JoinedPlayers2teams extends StatelessWidget {
  int count1 = 1;
  int count2 = 16;
  int number1;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('match')
          .doc(Match.mid)
          .collection('players')
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) return Text('Loading');
        return ListView(
          padding: const EdgeInsets.all(30),
          children: snapshot.data.docs.map((doc) {
            String name = doc['name'];
            int team = doc['team'];
            bool enabled = true;
            //print('name : $name  team :$team');
            return Container(
              margin: const EdgeInsets.only(top: 0.0, right: 20.0, left: 20.0),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Row(children: [
                    RaisedButton(
                      child: Row(children: <Widget>[
                        //width: 80.0,
                        Container(
                          width: 120.0,
                          child: Text('$name'),
                        ),
                        Text('$team'),
                      ]),
                      color: (team == 2 ? Colors.green[900] : Colors.blue[900]),
                      onPressed: () {
                        if (enabled) {
                          if (team == 1) {
                            number1 = count1;
                            count1++;
                          }
                          if (team == 2) {
                            number1 = count2;
                            count2++;
                          }
                          print(name);
                          print(number1);
                          enabled = false;
                        } else {
                          print(enabled);
                        }
                      },
                    ),

                    //Text('$name'),
                    //Text('$team'),
                  ]),
                ],
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
