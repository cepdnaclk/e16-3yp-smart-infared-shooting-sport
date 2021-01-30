import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:xtag_demo/Model/match.dart';

class JoinedPlayersfree4allJu extends StatelessWidget {
  int count1 = 1;
  int number1;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('match')
          .doc(Match.mid)
          .collection('players')
          .orderBy('score', descending: true)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) return Text('Loading');
        return ListView(
          padding: const EdgeInsets.all(30),
          children: snapshot.data.docs.map((doc) {
            String name = doc['name'];
            int score = doc['score'];
            bool enabled = true;
            //print('name : $name  team :$team');
            return Container(
              margin: const EdgeInsets.only(top: 0.0, right: 20.0, left: 60.0),
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
                          child: Text(' $name'),
                        ),
                        Container(
                          width: 20.0,
                          child: Text('$score'),
                        ),
                      ]),
                      color: Colors.green[700],
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
