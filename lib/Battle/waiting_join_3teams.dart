import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:xtag_demo/Battling/join3teams_normal_until_start.dart';
import 'package:xtag_demo/Model/match.dart';
import 'package:xtag_demo/Model/player1.dart';
import 'package:xtag_demo/Services/database.dart';
import 'join_game.dart';

class Join3Teams extends StatefulWidget {
  @override
  _Join3TeamsState createState() => _Join3TeamsState();
}

final FirebaseAuth _auth = FirebaseAuth.instance;

class _Join3TeamsState extends State<Join3Teams> {
  int _gunNumber = 0;
  int _teamNumber = 0;
  String _gameid = Match.mid;
  @override
  Widget build(BuildContext context) {
    String matchid = null;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('X Tage Battle'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                return JoinGame();
              }));
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(children: <Widget>[
            Container(
              height: 1000.0,
              width: 500,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/back1.jpg'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.blueAccent.withOpacity(1.0), BlendMode.dstIn),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 40.0, left: 40.0),
                    color: Colors.white,
                    height: 30.0,
                    child: Row(
                      children: [
                        Text(
                          '  Game ID  :   ',
                          style: TextStyle(fontSize: 15, color: Colors.black),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          _gameid,
                          style: TextStyle(fontSize: 15, color: Colors.black),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Text(
                    'Select a Gun ',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                    textAlign: TextAlign.left,
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 20.0, left: 20.0),
                    child: Row(
                      children: [
                        Container(
                            margin: const EdgeInsets.only(
                                top: 5.0, right: 5.0, left: 10.0),
                            child: RaisedButton(
                                elevation: 50.0,
                                color: (_gunNumber == 1)
                                    ? Colors.blue[900]
                                    : Colors.black54,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Colors.blue,
                                  ),
                                  //borderRadius: BorderRadius.circular(30.0)
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    const Text(
                                      'Gun 1',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.white),
                                    ),
                                  ],
                                ),
                                onPressed: () {
                                  setState(() {
                                    _gunNumber = 1;
                                  });
                                })),
                        Container(
                            margin: const EdgeInsets.only(
                                top: 5.0, right: 5.0, left: 10.0),
                            child: RaisedButton(
                                elevation: 50.0,
                                color: (_gunNumber == 2)
                                    ? Colors.blue[900]
                                    : Colors.black54,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Colors.blue,
                                  ),
                                  //borderRadius: BorderRadius.circular(30.0)
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    const Text(
                                      'Gun 2',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.white),
                                    ),
                                  ],
                                ),
                                onPressed: () {
                                  setState(() {
                                    _gunNumber = 2;
                                  });
                                })),
                        Container(
                            margin: const EdgeInsets.only(
                                top: 5.0, right: 5.0, left: 10.0),
                            child: RaisedButton(
                                elevation: 50.0,
                                color: _gunNumber == 3
                                    ? Colors.blue[900]
                                    : Colors.black54,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Colors.blue,
                                  ),
                                  //borderRadius: BorderRadius.circular(30.0)
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    const Text(
                                      'Gun 3',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.white),
                                    ),
                                  ],
                                ),
                                onPressed: () {
                                  setState(() {
                                    _gunNumber = 3;
                                  });
                                })),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Text(
                    'Select a Team ',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                    textAlign: TextAlign.left,
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 20.0, left: 20.0),
                    child: Row(
                      children: [
                        Container(
                            margin: const EdgeInsets.only(
                                top: 5.0, right: 5.0, left: 10.0),
                            child: RaisedButton(
                                elevation: 50.0,
                                color: (_teamNumber == 1)
                                    ? Colors.green[900]
                                    : Colors.black54,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Colors.black,
                                  ),
                                  //borderRadius: BorderRadius.circular(30.0)
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    const Text(
                                      'Team 1',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.white),
                                    ),
                                  ],
                                ),
                                onPressed: () {
                                  setState(() {
                                    _teamNumber = 1;
                                  });
                                })),
                        Container(
                            margin: const EdgeInsets.only(
                                top: 5.0, right: 5.0, left: 10.0),
                            child: RaisedButton(
                                elevation: 50.0,
                                color: (_teamNumber == 2)
                                    ? Colors.blue[900]
                                    : Colors.black54,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Colors.black,
                                  ),
                                  //borderRadius: BorderRadius.circular(30.0)
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    const Text(
                                      'Team 2',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.white),
                                    ),
                                  ],
                                ),
                                onPressed: () {
                                  setState(() {
                                    _teamNumber = 2;
                                  });
                                })),
                        Container(
                            margin: const EdgeInsets.only(
                                top: 5.0, right: 5.0, left: 10.0),
                            child: RaisedButton(
                                elevation: 50.0,
                                color: _teamNumber == 3
                                    ? Colors.yellow[900]
                                    : Colors.black54,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Colors.black,
                                  ),
                                  //borderRadius: BorderRadius.circular(30.0)
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    const Text(
                                      'Team 3',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.white),
                                    ),
                                  ],
                                ),
                                onPressed: () {
                                  setState(() {
                                    _teamNumber = 3;
                                  });
                                })),
                      ],
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.only(
                          top: 45.0, right: 80.0, left: 80.0),
                      child: RaisedButton(
                          elevation: 10.0,
                          color: Colors.lightBlueAccent,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: Colors.blue,
                              ),
                              borderRadius: BorderRadius.circular(30.0)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              const Icon(Icons.play_arrow_rounded,
                                  size: 30.0, color: Colors.white),
                              const Text(
                                'Ready To Battle',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                            ],
                          ),
                          onPressed: () async {
                            //set the gun
                            Player1.gun = _gunNumber;
                            Player1.team = _teamNumber;
                            Player1.health = 5;
                            try {
                              User user = _auth.currentUser;
                              await DatabaseServices(uid: user.uid)
                                  .upadtenestedplayersdata(
                                      _gameid, 'gun', _gunNumber);
                            } catch (e) {
                              print(e.toString());
                            }

                            //set the team
                            try {
                              User user = _auth.currentUser;
                              await DatabaseServices(uid: user.uid)
                                  .upadtenestedplayersdata(
                                      _gameid, 'team', _teamNumber);
                            } catch (e) {
                              print(e.toString());
                            }
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (_) {
                              return Join3teamNormalUntilStart();
                            }));
                            print(_gunNumber);
                          })),
                ],
              ),
            ),
          ]),
        ));
  }
}
