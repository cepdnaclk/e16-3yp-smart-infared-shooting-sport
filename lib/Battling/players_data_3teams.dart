import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:xtag_demo/Model/match.dart';

class JoinedPlayers3teamsSurv extends StatelessWidget {
  int count1 = 1;
  int number1;
  int score1 = 0;
  int score2 = 0;
  int score3 = 0;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('match')
          .doc(Match.mid)
          .collection('players')
          .orderBy('team', descending: false)
          .orderBy('score', descending: true)
          .orderBy('deaths', descending: true)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) return Text('Loading');
        return ListView(
          padding: const EdgeInsets.all(30),
          children: snapshot.data.docs.map((doc) {
            String name = doc['name'];
            int score = doc['score'];
            int team = doc['team'];
            int deaths = doc['deaths'];
            String status = 'Alive';
            if (deaths == 1) {
              status = 'Killed';
            }
            bool enabled = true;

            //print('name : $name  team :$team');
            return Container(
              margin: const EdgeInsets.only(top: 0.0, right: 20.0, left: 40.0),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Row(children: [
                    Container(
                      margin: const EdgeInsets.only(top: 2.0),
                      child: Row(children: <Widget>[
                        //width: 80.0,
                        Container(
                          width: 150.0,
                          child: Text(
                            ' $name',
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ),
                        Container(
                          width: 20.0,
                          child: Text(
                            '$score',
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ),
                        Container(
                          width: 50.0,
                          child: Text(
                            ' $status',
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ),
                      ]),
                      color: ((team == 1 && deaths == 0)
                          ? Colors.green[700]
                          : (team == 2 && deaths == 0)
                              ? Colors.blue[700]
                              : (team == 3 && deaths == 0)
                                  ? Colors.yellow[700]
                                  : Colors.black54),
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
