import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:xtag_demo/Battling/host_battle_normal_free.dart';
import 'package:xtag_demo/Model/player1.dart';
import 'package:xtag_demo/Services/blue.dart';
import 'package:xtag_demo/Services/database.dart';
import 'joined_players_free4all.dart';
import 'package:xtag_demo/Model/match.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class WaitingToStartfree4all extends StatelessWidget {
  String mode = Match.mode;
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
                    User user = _auth.currentUser;
                    try {
                      print('Setting the temp ids');
                      await DatabaseServices(uid: user.uid)
                          .settempid(Match.mid);
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
                    print(Match.mid);
                    if (Match.mode == 'n4') {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) {
                        print('sdds');
                        return Hostfree4allNormalUntilStart();
                      }));
                    }
                  }),
            ),
            Flexible(
              child: JoinedPlayersfree4all(),
            ),
          ],
        ),
      ),
    );
  }
}
