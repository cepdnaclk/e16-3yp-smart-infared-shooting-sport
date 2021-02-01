import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:xtag_demo/Battling/player_parameter.dart';
import 'package:xtag_demo/Battling/players_data_2teams_resc.dart';
import 'package:xtag_demo/Battling/players_data_normal3.dart';
import 'package:xtag_demo/Battling/time_display.dart';
import 'package:xtag_demo/Model/player1.dart';
import 'package:xtag_demo/Model/match.dart';

import 'package:xtag_demo/Results/result_team3_normal.dart';
import 'package:xtag_demo/Services/database.dart';
import 'package:xtag_demo/TeamSocres/team1.dart';
import 'package:xtag_demo/TeamSocres/team2.dart';
import 'package:xtag_demo/TeamSocres/team3.dart';

import 'battle_started_mas.dart';

class Host3teamNormalUntilStart extends StatefulWidget {
  @override
  _Host3teamNormalUntilStartState createState() =>
      _Host3teamNormalUntilStartState();
}

final FirebaseAuth _auth = FirebaseAuth.instance;

class _Host3teamNormalUntilStartState extends State<Host3teamNormalUntilStart> {
  //print(Match.mid);
  final bool isBattlefinished = true;
  int _shootid = 0;
  int damage;
  int teamid;
  int tempid;
  @override
  @override
  Widget build(BuildContext context) {
    //print(Match.mid);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('XTag Battle 3n'),
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
            TimeDisplay(),
            PlayerParameters(),
            Flexible(
              child: JoinedPlayers3teamNormal(),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0, right: 90.0, left: 90.0),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.deepPurple[900],
                    ),
                    borderRadius: BorderRadius.circular(20.0)),
                onPressed: () async {
                  //decrease the health**************************************************************************************
                  User user = _auth.currentUser;
                  String hisuid;
                  Player1.health = Player1.health - damage;
                  Player1.deaths = Player1.deaths + damage;
                  print(
                      'damage $damage , team $teamid , tempid $tempid  current health:${Player1.health} player team:${Player1.team}');

                  try {
                    await DatabaseServices(uid: user.uid)
                        .upadtenestedplayersdata(
                            Match.mid, 'health', Player1.health);
                    print(Player1.health);
                  } catch (e) {
                    print(e.toString());
                  }

                  //increase the deaths
                  try {
                    await DatabaseServices(uid: user.uid)
                        .upadtenestedplayersdata(
                            Match.mid, 'deaths', Player1.deaths);
                    print(Player1.deaths);
                  } catch (e) {
                    print(e.toString());
                  }

                  //get  his id
                  try {
                    hisuid = await DatabaseServices(uid: user.uid)
                        .getshootedplayerdata(Match.mid, teamid, tempid);
                    print(hisuid);
                  } catch (e) {
                    print(e.toString());
                  }
                  //set his data
                  try {
                    await DatabaseServices(uid: user.uid)
                        .updatehisdata(Match.mid, hisuid, Player1.team);
                  } catch (e) {
                    print(e.toString());
                  }

                  //set my data
                  try {
                    await DatabaseServices(uid: user.uid)
                        .setmyshotdata(Match.mid, hisuid);
                  } catch (e) {
                    print(e.toString());
                  }
                  //increase the enemy player score
                  try {
                    await DatabaseServices(uid: user.uid)
                        .increasehisscorre(hisuid, Match.mid, damage);
                  } catch (e) {
                    print(e.toString());
                  }
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
              height: 20.0,
              width: 30.0,
              child: Container(
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  //inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                  //validator: numberValidator,,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 10.0,
                  ),
                  onChanged: (val) {
                    damage = int.parse(val);
                  },
                ),
              ),
            ),
            SizedBox(
              height: 2.0,
            ),
            Container(
              color: Colors.white,
              height: 20.0,
              width: 30.0,
              child: Container(
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  //inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                  //validator: numberValidator,,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12.0,
                  ),
                  onChanged: (val) {
                    teamid = int.parse(val);
                    ;
                  },
                ),
              ),
            ),
            SizedBox(
              height: 2.0,
            ),
            Container(
              color: Colors.white,
              height: 20.0,
              width: 30.0,
              child: Container(
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  //inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                  //validator: numberValidator,,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12.0,
                  ),
                  onChanged: (val) {
                    tempid = int.parse(val);
                  },
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5.0, right: 90.0, left: 90.0),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.deepPurple[900],
                    ),
                    borderRadius: BorderRadius.circular(20.0)),
                onPressed: () {},
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
                  print(isBattlefinished);
                  Team1.score = 0;
                  Team1.deaths = 0;
                  Team1.kills = 0;
                  Team2.score = 0;
                  Team2.deaths = 0;
                  Team2.kills = 0;
                  Team3.score = 0;
                  Team3.deaths = 0;
                  Team3.kills = 0;
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
                              if (doc['team'] == 3) {
                                Team3.score = Team3.score + doc['score'];
                                Team3.deaths = Team3.deaths + doc['deaths'];
                                Team3.kills = Team3.kills + doc['kills'];
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
                  if (isBattlefinished) {
                    print('battle Ended');
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                      print('sdds');
                      print(Match.pom);
                      print(Match.poms);
                      return Result3teamNormal();
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
