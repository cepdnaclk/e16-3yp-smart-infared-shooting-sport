import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:xtag_demo/Battling/player_parameter.dart';
import 'package:xtag_demo/Battling/players_data_2teams_resc.dart';
import 'package:xtag_demo/Battling/time_display.dart';
import 'package:xtag_demo/Model/player1.dart';
import 'package:xtag_demo/Model/match.dart';
import 'package:xtag_demo/PlayModes/timer2.dart';
import 'package:xtag_demo/PlayModes/timerh.dart';
import 'package:xtag_demo/Results/result_2tams_resc.dart';
import 'package:xtag_demo/Services/blue.dart';
import 'package:xtag_demo/Services/database.dart';
import 'package:xtag_demo/TeamSocres/team1.dart';
import 'package:xtag_demo/TeamSocres/team2.dart';

import 'battle_started_mas.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class Host2teamNormalUntilStart extends StatefulWidget {
  @override
  _Host2teamNormalUntilStartState createState() =>
      _Host2teamNormalUntilStartState();
}

class _Host2teamNormalUntilStartState extends State<Host2teamNormalUntilStart> {
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
        title: Text('XTag Battle n2'),
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
            TimerCounter2(),
            Timern(),
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
                  print(Match.mid);

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

                  //respan the player
                  if (Player1.health <= 0) {
                    String kill = "K1";
                    try {
                      await BluetoothServices().write(kill);
                    } catch (e) {
                      print(e.toString());
                    }
                    await Future.delayed(Duration(seconds: 10));
                    Player1.health = 5;
                    kill = "K0";
                    try {
                      await BluetoothServices().write(kill);
                    } catch (e) {
                      print(e.toString());
                    }
                    try {
                      await DatabaseServices(uid: user.uid)
                          .upadtenestedplayersdata(
                              Match.mid, 'health', Player1.health);
                      print(Player1.health);
                    } catch (e) {
                      print(e.toString());
                    }
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
          ],
        ),
      ),
    );
  }
}
