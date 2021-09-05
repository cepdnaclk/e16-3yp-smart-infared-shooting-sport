import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:xtag_demo/Battling/joinfree4all_until_start.dart';
import 'package:xtag_demo/Services/database.dart';

import 'join_game.dart';
import 'package:xtag_demo/Services/blue.dart';

class Joinfre4all extends StatefulWidget {
  @override
  _Joinfre4allState createState() => _Joinfre4allState();
}

final FirebaseAuth _auth = FirebaseAuth.instance;

class _Joinfre4allState extends State<Joinfre4all> {
  int _gunNumber = 0;
  int _teamNumber = 0;
  String _gameid = 'hhd63shd8438';
  String gamedata;
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
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            ),
                          ],
                        ),
                        onPressed: () async {
                          gamedata = 'T$_teamNumber$_gunNumber';
                          try {
                            await BluetoothServices().write(gamedata);
                          } catch (e) {
                            print(e.toString());
                          }
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
                          if (_gunNumber != 0) {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (_) {
                              print('sdds');
                              return Joinfree4allUntilStart();
                            }));
                          }
                          print(_gunNumber);
                        },
                      )),
                ],
              ),
            ),
          ]),
        ));
  }
}
