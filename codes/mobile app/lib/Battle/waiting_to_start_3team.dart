import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:xtag_demo/Battle/joined_players_3team.dart';
import 'package:xtag_demo/Battling/host_battle_3teams_normal.dart';
import 'package:xtag_demo/Battling/host_battle_3teams_resc.dart';
import 'package:xtag_demo/Battling/host_battle_3teams_surv.dart';
import 'package:xtag_demo/Model/match.dart';
import 'package:xtag_demo/Model/player1.dart';
import 'package:xtag_demo/Services/blue.dart';
import 'package:xtag_demo/Services/database.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
int _gunNumber = Player1.gun;
int _teamNumber = Player1.team;

class WaitingToStart3teams extends StatelessWidget {
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
                    child: Text('    Start the battle'),
                  ),
                ]),
                color: Colors.green[700],
                onPressed: () async {
                  //To do set the isStarted status to true
                  //set the temp id
                  User user = _auth.currentUser;
                  try {
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
                  String tempid;
                  if (Player1.tempid < 10) {
                    tempid = "0${Player1.tempid}";
                    temp = "T$_teamNumber$_gunNumber$tempid";
                  } else {
                    tempid = "${Player1.tempid}";
                    temp = "T$_teamNumber$_gunNumber$tempid";
                  }
                  print("Data :$temp");
                  try {
                    await BluetoothServices().write(temp);
                  } catch (e) {
                    print(e.toString());
                  }
                  if (Match.mode == 's3') {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                      print('sdds');
                      return Host3teamSurvlUntilStart();
                    }));
                  }
                  if (Match.mode == 'n3') {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                      print('sdds');
                      return Host3teamNormalUntilStart();
                    }));
                  }
                  if (Match.mode == 'r3') {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                      print('sdds');
                      return Host3teamRescUntilStart();
                    }));
                  }
                },
              ),
            ),
            Flexible(
              child: JoinedPlayers3teams(),
            ),
          ],
        ),
      ),
    );
  }
}
