import 'package:flutter/material.dart';

import 'package:xtag_demo/Battling/player_parameter.dart';
import 'package:xtag_demo/Battling/players_data_2teams_resc.dart';
import 'package:xtag_demo/Battling/time_display.dart';
import 'package:xtag_demo/Results/result_2tams_resc.dart';

import 'battle_started_mas.dart';

class Host2teamResclUntilStart extends StatefulWidget {
  @override
  _Host2teamResclUntilStartState createState() =>
      _Host2teamResclUntilStartState();
}

class _Host2teamResclUntilStartState extends State<Host2teamResclUntilStart> {
  //print(Match.mid);
  final bool isBattlefinished = true;
  @override
  @override
  Widget build(BuildContext context) {
    //print(Match.mid);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('XTag Battle'),
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
              child: JoinedPlayers2teamsResc(),
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
                onPressed: () {
                  print(isBattlefinished);
                  if (!isBattlefinished) {
                    print('battle Ended');
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                      print('sdds');
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
