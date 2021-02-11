import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/material.dart";
import 'package:xtag_demo/Model/match.dart';
import 'package:xtag_demo/Model/player1.dart';

class PlayedMatches extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('player')
          .doc(Player1.uid)
          .collection('playedmatch')
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) return Text('Loading');
        return ListView(
          padding: const EdgeInsets.all(30),
          children: snapshot.data.docs.map((doc) {
            String mod = doc['mode'];
            int score = doc['score'];
            int deaths = doc['deaths'];

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
                            ' $mod',
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
                            ' $deaths',
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
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
