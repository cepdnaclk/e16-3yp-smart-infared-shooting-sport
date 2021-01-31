import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:xtag_demo/Battling/player_parameter.dart';
import 'package:xtag_demo/Battling/players_data_2teams_resc.dart';
import 'package:xtag_demo/Battling/players_data_normal3.dart';

import 'package:xtag_demo/Battling/time_display.dart';
import 'package:xtag_demo/Model/player1.dart';
import 'package:xtag_demo/Model/match.dart';
import 'package:xtag_demo/Results/result_2tams_resc.dart';
import 'package:xtag_demo/TeamSocres/team1.dart';
import 'package:xtag_demo/TeamSocres/team2.dart';

import 'battle_started_mas.dart';

class Join2teamRescUntilStart extends StatefulWidget {
  @override
  _Join2teamRescUntilStartState createState() =>
      _Join2teamRescUntilStartState();
}

class _Join2teamRescUntilStartState extends State<Join2teamRescUntilStart> {
  final bool isBattlefinished = true;
  int _shootid = 0;
  var it;
  @override
  @override
  Widget build(BuildContext context) {
    //print(Match.mid);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("XTag 2r"),
      ),
      body: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/back1.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.blueAccent.withOpacity(1.0), BlendMode.dstIn),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MatchStartedMsg(),
            TimeDisplay(),
            PlayerParameters(),
            Flexible(
              child: JoinedPlayers2teamsResc(),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0, right: 90.0, left: 90.0),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.deepPurple[900],
                    ),
                    borderRadius: BorderRadius.circular(20.0)),
                onPressed: () {
                  print(it);
                },
                child: Row(children: <Widget>[
                  //width: 80.0,
                  Container(
                    child: Text('      Get hit '),
                  ),
                ]),
              ),
            ),
            Container(
              color: Colors.white,
              width: 50.0,
              child: TextFormField(
                keyboardType: TextInputType.number,
                //inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                //validator: numberValidator,,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                ),
                onChanged: (val) {
                  it = int.parse(val);
                  setState(() => _shootid = it);
                  print(it);
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0, right: 90.0, left: 90.0),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.deepPurple[900],
                    ),
                    borderRadius: BorderRadius.circular(20.0)),
                onPressed: () {
                  //print(it);
                  //print(Match.mode);
                  print('sfsffs');
                  print(Player1.uid);
                },
                child: Row(children: <Widget>[
                  //width: 80.0,
                  Container(
                    child: Text('      Shoot '),
                  ),
                ]),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20.0, right: 90.0, left: 90.0),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.deepPurple[900],
                    ),
                    borderRadius: BorderRadius.circular(20.0)),
                child: Row(children: <Widget>[
                  //width: 80.0,
                  Container(
                    child: Text(' Go & See the Results '),
                  ),
                ]),
                color: Colors.red[900],
                onPressed: () async {
                  Team1.score = 0;
                  Team1.deaths = 0;
                  Team1.kills = 0;
                  Team2.score = 0;
                  Team2.deaths = 0;
                  Team2.kills = 0;
                  await FirebaseFirestore.instance
                      .collection('match')
                      .doc(Match.mid)
                      .collection('players')
                      .doc(Player1.uid)
                      .get()
                      .then((DocumentSnapshot documentSnapshot) {
                    Player1.deaths = documentSnapshot['deaths'];
                    Player1.kills = documentSnapshot['kills'];
                    Player1.score = documentSnapshot['score'];
                  });
                  await FirebaseFirestore.instance
                      .collection('match')
                      .doc(Match.mid)
                      .collection('players')
                      .get()
                      .then((QuerySnapshot querySnapshot) => {
                            querySnapshot.docs.forEach((doc) {
                              if (doc['team'] == 1) {
                                Team1.score = Team1.score + doc['score'];
                                Team1.deaths = Team1.deaths + doc['deaths'];
                                Team1.kills = Team1.kills + doc['kills'];
                              }
                              if (doc['team'] == 2) {
                                Team2.score = Team2.score + doc['score'];
                                Team2.deaths = Team2.deaths + doc['deaths'];
                                Team2.kills = Team2.kills + doc['kills'];
                              }
                            })
                          });
                  await FirebaseFirestore.instance
                      .collection('match')
                      .doc(Match.mid)
                      .collection('players')
                      .orderBy('score', descending: true)
                      .get()
                      .then((QuerySnapshot querySnapshot) => {
                            Match.pom = querySnapshot.docs[0]['name'],
                            Match.poms = querySnapshot.docs[0]['score']
                          });
                  if (true) {
                    print('battle Ended');
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                      print('sdds');
                      print(Match.pom);
                      print(Match.poms);
                      return Result2teamResc();
                    }));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
