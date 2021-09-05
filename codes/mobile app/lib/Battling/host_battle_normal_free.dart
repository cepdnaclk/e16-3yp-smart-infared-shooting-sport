import 'package:flutter/material.dart';
import 'package:xtag_demo/Battle/creat_game.dart';
import 'package:xtag_demo/Battling/player_parameter.dart';
import 'package:xtag_demo/Battling/players_data_free4all_name.dart';
import 'package:xtag_demo/Battling/time_display.dart';

import 'battle_started_mas.dart';

class Hostfree4allNormalUntilStart extends StatefulWidget {
  @override
  _Hostfree4allNormalUntilStartState createState() =>
      _Hostfree4allNormalUntilStartState();
}

class _Hostfree4allNormalUntilStartState
    extends State<Hostfree4allNormalUntilStart> {
  //print(Match.mid);
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
            /*SizedBox(
              height: 20.0,
            ),*/
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
                onPressed: () {},
              ),
            ),*/

            TimeDisplay(),
            PlayerParameters(),
            Flexible(
              child: JoinedPlayersfree4allJu(),
            ),
          ],
        ),
      ),
    );
  }
}
