import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:xtag_demo/Battling/host_battle_2teams_normal.dart';

import 'package:xtag_demo/Battling/host_battle_2teams_resc.dart';
import 'package:xtag_demo/Battling/host_battle_3teams_surv.dart';
import 'package:xtag_demo/Model/match.dart';
import 'package:xtag_demo/Model/player1.dart';
import 'package:xtag_demo/Services/blue.dart';
import 'package:xtag_demo/Services/database.dart';

import 'joined_players_2team.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class WaitingToStart2teams extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Waiting to Begin'),
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
            /*SizedBox(
              height: 20.0,
            ),*/
            Container(
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
                    child: Text('    Start the battle 2'),
                  ),
                ]),
                color: Colors.green[700],
                onPressed: () async {
                  //set the temp id

                  User user = _auth.currentUser;
                  try {
                    User user = _auth.currentUser;
                    print('Setting the temp ids');
                    await DatabaseServices(uid: user.uid).settempid(Match.mid);
                  } catch (e) {
                    print(e.toString());
                  }
                  try {
                    await DatabaseServices(uid: user.uid)
                        .gettempid(Match.mid, user.uid);
                  } catch (e) {
                    print(e.toString());
                  }
                  String temp;
                  if (Player1.tempid < 10) {
                    temp = "I0${Player1.tempid}";
                  } else {
                    temp = "I${Player1.tempid}";
                  }
                  try {
                    await BluetoothServices().write(temp);
                  } catch (e) {
                    print(e.toString());
                  }
                  if (Match.mode == 's2') {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                      print('sdds');
                      return Host3teamSurvlUntilStart();
                    }));
                  }

                  print(Match.mid);
                  if (Match.mode == 'r2') {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                      print('sdds');
                      return Host2teamResclUntilStart();
                    }));
                  }
                  if (Match.mode == 'n2') {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                      print('sdds');
                      return Host2teamNormalUntilStart();
                    }));
                  }
                },
              ),
            ),
            Flexible(
              child: JoinedPlayers2teams(),
            ),
          ],
        ),
      ),
    );
  }
}

class Host2teamSurvlUntilStart {}

class Host2teamNormallUntilStart {}
