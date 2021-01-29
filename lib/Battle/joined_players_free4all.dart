import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:xtag_demo/Model/match.dart';
import 'creat_game.dart';

class JoinedPlayersfree4all extends StatelessWidget {
  int count1 = 1;
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
                      ]),
                      color: Colors.green[900],
                      onPressed: () {
                        if (enabled) {
                          number1 = count1;
                          count1++;

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
