import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:xtag_demo/Battling/player_parameter.dart';
import 'package:xtag_demo/Battling/players_data_normal3.dart';
import 'package:xtag_demo/Model/player1.dart';
import 'package:xtag_demo/Model/match.dart';
import 'package:xtag_demo/PlayModes/timer2.dart';
import 'package:xtag_demo/PlayModes/timerh.dart';
import 'package:xtag_demo/Services/blue.dart';
import 'package:xtag_demo/Services/database.dart';
import 'battle_started_mas.dart';
import 'dart:convert';

class Host3teamNormalUntilStart extends StatefulWidget {
  @override
  _Host3teamNormalUntilStartState createState() =>
      _Host3teamNormalUntilStartState();
}

final FirebaseAuth _auth = FirebaseAuth.instance;

class _Host3teamNormalUntilStartState extends State<Host3teamNormalUntilStart> {
  //print(Match.mid);
  final bool isBattlefinished = true;
  List<BluetoothDiscoveryResult> results = List<BluetoothDiscoveryResult>();
  int _shootid = 0;
  int damage;
  int teamid;
  int tempid;
  String op;
  String opp;
  String hisuid;
  String d;
  User user = _auth.currentUser;
  void con() {
    print(Player1.conect);
    String shot_code;
    Player1.conect.input.listen((data) async {
      String op = ascii.decode(data);
      print('Arduino op Data: $op');
      int len = op.length;

      if (op[len - 1] != "!") {
        if (op[0] == "Z") {
          shot_code = op;
        } else {
          shot_code = shot_code + op;
        }
      } else if (op[len - 1] == "!") {
        shot_code = shot_code + op;
        print('Arduino shot Data: $shot_code');
        teamid = int.parse(shot_code[1]);
        damage = int.parse(shot_code[2]);
        if (shot_code.length == 5) {
          tempid = int.parse(shot_code[3]);
        } else if (shot_code.length == 6) {
          tempid = int.parse(shot_code[3] + shot_code[4]);
        }
        print("Team  : $teamid");
        print("Damage : $damage");
        print("tempid : $tempid");
        Player1.health = Player1.health - damage;
        Player1.deaths = Player1.deaths + damage;
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
      }
    });
  }

  @override
  @override
  Widget build(BuildContext context) {
    print(Match.mid);
    con();
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
            MatchStartedMsg(),
            TimerCounter2(),
            Timern(),
            PlayerParameters(),
            Flexible(
              child: JoinedPlayers3teamNormal(),
            ),
          ],
        ),
      ),
    );
  }
}
