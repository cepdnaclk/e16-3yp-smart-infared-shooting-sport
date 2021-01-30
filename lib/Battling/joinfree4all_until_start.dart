import 'package:flutter/material.dart';
import 'package:xtag_demo/Battling/player_data_free4all.dart';
import 'package:xtag_demo/Battling/time_display.dart';

class Joinfree4allUntilStart extends StatefulWidget {
  @override
  _Joinfree4allUntilStartState createState() => _Joinfree4allUntilStartState();
}

class _Joinfree4allUntilStartState extends State<Joinfree4allUntilStart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Wait until the host start play '),
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
                onPressed: () {},
              ),
            ),
            TimeDisplay(),
            Flexible(
              child: JoinedPlayersfree4allJu(),
            ),
          ],
        ),
      ),
    );
  }
}
