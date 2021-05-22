import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:xtag_demo/Battling/player_parameter.dart';
import 'package:xtag_demo/Battling/players_data_normal3.dart';
import 'package:xtag_demo/Model/player1.dart';
import 'package:xtag_demo/Model/match.dart';
import 'package:xtag_demo/PlayModes/timern.dart';
import 'package:xtag_demo/Services/blue.dart';
import 'package:xtag_demo/Services/database.dart';
import 'battle_started_mas.dart';
import 'dart:convert';

final FirebaseAuth _auth = FirebaseAuth.instance;

class Join3teamNormalUntilStart extends StatefulWidget {
  @override
  _Join3teamNormalUntilStartState createState() =>
      _Join3teamNormalUntilStartState();
}

class _Join3teamNormalUntilStartState extends State<Join3teamNormalUntilStart> {
  final bool isBattlefinished = true;
  int _shootid = 0;
  int damage;
  int teamid;
  int tempid;
  String op;
  String opp;
  var damage1;
  var kiltemp;
  var kilteam;
  String hisuid;
  String d;
  String kill;
  User user = _auth.currentUser;

  void con() {
    print(Player1.conect);
    Player1.conect.input.listen((data) async {
      //print('Arduino hData : ${ascii.decode(data)}');
      //print('Arduino hData : ${(data)}');
      /*op = ascii.decode(data) + " Foot";
      d = ascii.decode(data);
      kilteam = int.parse(d[0]);
      kiltemp = int.parse(d[1] + d[2]);
      damage1 = int.parse(d[3]);
      Player1.health = Player1.health - damage1;
      Player1.deaths = Player1.deaths + damage1;*/
      String op = ascii.decode(data);
      print('Arduino op Data: $op');
      if (op == "!") {
        print("The sent dellivered infor : $d");
        kilteam = int.parse(d[0]);
        kiltemp = int.parse(d[1] + d[2]);
        damage1 = int.parse(d[3]);
        print("Kill Team : $kilteam Kiltem : $kiltemp sdsdds: $damage1 ");
        Player1.health = Player1.health - damage1;
        Player1.deaths = Player1.deaths + damage1;
        try {
          await DatabaseServices(uid: user.uid)
              .upadtenestedplayersdata(Match.mid, 'health', Player1.health);
          print(Player1.health);
        } catch (e) {
          print(e.toString());
        }

        //increase the deaths
        try {
          await DatabaseServices(uid: user.uid)
              .upadtenestedplayersdata(Match.mid, 'deaths', Player1.deaths);
          print(Player1.deaths);
        } catch (e) {
          print(e.toString());
        }
        print(Match.mid);

        //get  his id
        try {
          hisuid = await DatabaseServices(uid: user.uid)
              .getshootedplayerdata(Match.mid, kilteam, kiltemp);
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
              .increasehisscorre(hisuid, Match.mid, damage1);
        } catch (e) {
          print(e.toString());
        }

        //respan the player
        if (Player1.health <= 0) {
          try {
            await BluetoothServices().write("d");
          } catch (e) {
            print(e.toString());
          }
          await Future.delayed(Duration(seconds: 10));
          Player1.health = 5;

          try {
            await BluetoothServices().write("a");
          } catch (e) {
            print(e.toString());
          }
          try {
            await DatabaseServices(uid: user.uid)
                .upadtenestedplayersdata(Match.mid, 'health', Player1.health);
            print(Player1.health);
          } catch (e) {
            print(e.toString());
          }
        }
        d = null;
      } else {
        d = d + op;
        print("The input is creating : $d");
      }

      /*setState(() {
        op = d + " Foot";
      });*/
    });
  }

  @override
  @override
  Widget build(BuildContext context) {
    con();
    //print(Match.mid);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("XTag 3n"),
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
            TimernJ(),
            PlayerParameters(),
            Flexible(
              child: JoinedPlayers3teamNormal(),
            ),
            /*Container(
              margin:
                  const EdgeInsets.only(top: 20.0, right: 100.0, left: 100.0),
              child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.deepPurple[900],
                      ),
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Row(children: <Widget>[
                    //width: 80.0,
                    Container(
                      child: Text('    Start the battle'),
                    ),
                  ]),
                  color: Colors.green[700],
                  onPressed: () async {
                    //print("Z1001");
                    try {
                      await BluetoothServices().write("Z2341");
                    } catch (e) {
                      print(e.toString());
                    }
                  }),
            ),*/
            /*Container(
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
            ),*/
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
          ],
        ),
      ),
    );
  }
}
