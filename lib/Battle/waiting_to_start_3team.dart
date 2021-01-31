import 'package:flutter/material.dart';
import 'package:xtag_demo/Battle/joined_players_3team.dart';
import 'package:xtag_demo/Battling/host_battle_3teams_resc.dart';
import 'package:xtag_demo/Battling/host_battle_normal_3team.dart';
import 'package:xtag_demo/Battling/host_battle_surv_3teams.dart';
import 'package:xtag_demo/Model/match.dart';

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
                onPressed: () {
                  print(Match.mid);
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
