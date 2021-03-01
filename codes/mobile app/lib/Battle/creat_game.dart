import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:xtag_demo/Battle/waiting_host_2teams.dart';
import 'package:xtag_demo/Battle/waiting_host_3teams.dart';
import 'package:xtag_demo/Battle/waiting_host_free4all.dart';
import 'package:xtag_demo/Model/player1.dart';
import 'package:xtag_demo/Services/database.dart';
import 'package:xtag_demo/Model/match.dart';

class CreateGame extends StatefulWidget {
  static String matchid = mid;
  @override
  _CreateGameState createState() => _CreateGameState();
}

final FirebaseAuth _auth = FirebaseAuth.instance;
String mid;

class _CreateGameState extends State<CreateGame> {
  bool _normal = false;
  bool _rescue = false;
  bool _survival = false;
  bool _twoteam = false;
  bool _free4all = false;
  bool _threeteam = false;
  String name = Player1.name;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Create New Battle'),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/back1.jpg'),
          fit: BoxFit.cover,
          //colorFilter: ColorFilter.mode(Colors.black.withOpacity(1.7), BlendMode.dstATop)
        )),
        //color: Colors.red[300],
        width: double.infinity,
        height: double.infinity,
        child: ListView(children: <Widget>[
          Container(
              margin: const EdgeInsets.only(top: 30.0, right: 50.0, left: 50.0),
              alignment: Alignment.center,
              child: Text(
                "Now you can create game and join others",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.yellow,
                ),
              )),
          Container(
              margin: const EdgeInsets.only(top: 50.0, right: 20.0, left: 20.0),
              //alignment: Alig,
              child: Text(
                "Select the game mode",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              )),
          Container(
            margin: const EdgeInsets.only(top: 30.0, right: 20.0, left: 20.0),
            alignment: Alignment.center,
            child: Row(
              children: <Widget>[
                RaisedButton(
                    elevation: 10.0,
                    color: _normal ? Colors.blue[900] : Colors.black54,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(30.0)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const Icon(Icons.circle,
                            size: 10.0, color: Colors.white),
                        const Text(
                          ' Normal',
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                      ],
                    ),
                    onPressed: () async {
                      print('normal mode selected');
                      //set the database
                      /*User user = _auth.currentUser;
                      await DatabaseServices(uid: user.uid)
                          .updateMatchMode('normal);*/
                      setState(() {
                        _normal = true;
                        _rescue = false;
                        _survival = false;
                      });
                    }),
                Container(
                  width: 10.0,
                ),
                RaisedButton(
                    elevation: 10.0,
                    color: _survival ? Colors.blue[900] : Colors.black54,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(30.0)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const Icon(Icons.directions_run,
                            size: 10.0, color: Colors.white),
                        const Text(
                          'Servival',
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                      ],
                    ),
                    onPressed: () {
                      setState(() {
                        print('survival selected');
                        _normal = false;
                        _rescue = false;
                        _survival = true;
                      });
                    }),
                Container(
                  width: 10.0,
                ),
                RaisedButton(
                    elevation: 10.0,
                    color: _rescue ? Colors.blue[900] : Colors.black54,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(30.0)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const Icon(Icons.assistant_rounded,
                            size: 10.0, color: Colors.white),
                        const Text(
                          'Rescue',
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                      ],
                    ),
                    onPressed: () {
                      print('rescue mode selected');
                      setState(() {
                        _normal = false;
                        _rescue = true;
                        _survival = false;
                      });
                    }),
              ],
            ),
          ),
          Container(
              margin: const EdgeInsets.only(top: 50.0, right: 20.0, left: 20.0),
              //alignment: Alig,
              child: Text(
                "Select the game type",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              )),
          Container(
            margin: const EdgeInsets.only(top: 30.0, right: 10.0, left: 20.0),
            alignment: Alignment.center,
            child: Row(
              children: <Widget>[
                SizedBox(
                  height: 100.0,
                  width: 150.0,
                  child: RaisedButton(
                      elevation: 10.0,
                      color: _twoteam ? Colors.blue[900] : Colors.black54,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(30.0)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const Icon(Icons.group_outlined,
                              size: 30.0, color: Colors.white),
                          const Text(
                            ' 2 Teams',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ],
                      ),
                      onPressed: () {
                        setState(() {
                          _twoteam = true;
                          _free4all = false;
                          _threeteam = false;
                        });
                      }),
                ),
                Container(
                  width: 10.0,
                ),
                SizedBox(
                  height: 100.0,
                  width: 150.0,
                  child: RaisedButton(
                      elevation: 10.0,
                      color: _threeteam ? Colors.blue[900] : Colors.black54,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(30.0)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const Icon(Icons.group_add_outlined,
                              size: 25.0, color: Colors.white),
                          const Text(
                            ' 3 Teams ',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ],
                      ),
                      onPressed: () {
                        setState(() {
                          _twoteam = false;
                          _free4all = false;
                          _threeteam = true;
                        });
                      }),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30.0, right: 10.0, left: 20.0),
            alignment: Alignment.center,
            child: SizedBox(
              height: 100.0,
              width: 150.0,
              child: RaisedButton(
                  elevation: 10.0,
                  color: _free4all ? Colors.blue[900] : Colors.black54,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(30.0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Icon(Icons.account_circle_outlined,
                          size: 25.0, color: Colors.white),
                      const Text(
                        '  Free 4 All',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ],
                  ),
                  onPressed: () {
                    setState(() {
                      _twoteam = false;
                      _free4all = true;
                      _threeteam = false;
                    });
                  }),
            ),
          ),
          Container(height: 50.0),
          Container(
            height: 50.0,
            margin: const EdgeInsets.only(top: 30.0, right: 10.0, left: 20.0),
            alignment: Alignment.center,
            child: SizedBox(
              height: 100.0,
              width: 260.0,
              child: RaisedButton(
                  elevation: 10.0,
                  color: Colors.green[600],
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(30.0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Icon(Icons.account_circle,
                          size: 25.0, color: Colors.white),
                      const Text(
                        'Create Battle',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ],
                  ),
                  onPressed: () async {
                    Player1.health = 5;
                    Player1.deaths = 0;
                    Player1.kills = 0;
                    Match.started = false;
                    if (_normal) {
                      if (_twoteam) {
                        print('Normal Two Teams1');
                        /*  User user = _auth.currentUser;
                        Match.mid = 'F25APUYrNOr2yYJ0vOyu';

                        String name1 = await DatabaseServices(uid: user.uid)
                            .getshootedplayerdata('0fWRQMUl9SvvpwuKx60D', 2, 2);

                        print(name1);*/
                        try {
                          User user = _auth.currentUser;
                          //String name = user.name;
                          Match.mode = "n2";
                          Match.mid = await DatabaseServices(uid: user.uid)
                              .updateMatchMode('n2', true, true, false, 180,
                                  'Game startted');
                          print(Match.mid);
                          //update the nested collection
                          await DatabaseServices(uid: user.uid)
                              .updateNestedplayers(
                                  Match.mid,
                                  name,
                                  null,
                                  true,
                                  5,
                                  0,
                                  0,
                                  user.uid,
                                  0,
                                  null,
                                  null,
                                  null,
                                  0,
                                  null,
                                  false,
                                  null,
                                  null,
                                  null,
                                  null);
                        } catch (e) {
                          print(e.toString());
                        }
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (_) {
                          return Normal2Teams();
                        }));
                      }
                      if (_threeteam) {
                        print('Normal Three teams');
                        Player1.health = 5;
                        Player1.deaths = 0;
                        Player1.kills = 0;
                        try {
                          User user = _auth.currentUser;

                          Match.mid = await DatabaseServices(uid: user.uid)
                              .updateMatchMode(
                                  'n3', true, true, false, 180, 'Game started');
                          Match.mode = "n3";
                          print(Match.mid);
                          //update the nested collection
                          await DatabaseServices(uid: user.uid)
                              .updateNestedplayers(
                                  Match.mid,
                                  name,
                                  null,
                                  true,
                                  5,
                                  0,
                                  0,
                                  user.uid,
                                  0,
                                  null,
                                  null,
                                  null,
                                  0,
                                  null,
                                  false,
                                  null,
                                  null,
                                  null,
                                  null);
                        } catch (e) {
                          print(e.toString());
                        }
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (_) {
                          return Normal3Teams();
                        }));
                      }
                      if (_free4all) {
                        print('Normal Free 4 all');
                        try {
                          User user = _auth.currentUser;

                          Match.mid = await DatabaseServices(uid: user.uid)
                              .updateMatchMode(
                                  'n4', true, true, false, 180, 'Game started');
                          print(Match.mid);
                          Match.mode = "n4";
                          print(Match.mode);
                          //update the nested collection
                          await DatabaseServices(uid: user.uid)
                              .updateNestedplayers(
                                  Match.mid,
                                  name,
                                  null,
                                  true,
                                  5,
                                  0,
                                  0,
                                  user.uid,
                                  0,
                                  null,
                                  null,
                                  null,
                                  0,
                                  null,
                                  false,
                                  null,
                                  null,
                                  null,
                                  null);
                        } catch (e) {
                          print(e.toString());
                        }
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (_) {
                          return NormalFree4All();
                        }));
                      }
                    }
                    if (_rescue) {
                      if (_twoteam) {
                        print('rescue Two teams');
                        Player1.health = 5;
                        Player1.deaths = 0;
                        Player1.kills = 0;
                        try {
                          User user = _auth.currentUser;

                          Match.mid = await DatabaseServices(uid: user.uid)
                              .updateMatchMode(
                                  'r2', true, true, false, 180, 'Game started');
                          print(Match.mid);
                          Match.mode = "r2";
                          //update the nested collection
                          await DatabaseServices(uid: user.uid)
                              .updateNestedplayers(
                                  Match.mid,
                                  name,
                                  null,
                                  true,
                                  5,
                                  0,
                                  0,
                                  user.uid,
                                  0,
                                  null,
                                  null,
                                  null,
                                  0,
                                  null,
                                  false,
                                  null,
                                  null,
                                  null,
                                  null);
                        } catch (e) {
                          print(e.toString());
                        }
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (_) {
                          return Normal2Teams();
                        }));
                      }
                      if (_threeteam) {
                        print('rescuel Three teams');
                        try {
                          User user = _auth.currentUser;

                          Match.mid = await DatabaseServices(uid: user.uid)
                              .updateMatchMode(
                                  'r3', true, true, false, 180, 'Game started');
                          print(Match.mid);
                          Match.mode = "r3";
                          //update the nested collection
                          await DatabaseServices(uid: user.uid)
                              .updateNestedplayers(
                                  Match.mid,
                                  name,
                                  null,
                                  true,
                                  5,
                                  0,
                                  0,
                                  user.uid,
                                  0,
                                  null,
                                  null,
                                  null,
                                  0,
                                  null,
                                  false,
                                  null,
                                  null,
                                  null,
                                  null);
                        } catch (e) {
                          print(e.toString());
                        }
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (_) {
                          return Normal3Teams();
                        }));
                      }
                      if (_free4all) {
                        print('rescue free for all');
                        try {
                          User user = _auth.currentUser;

                          Match.mid = await DatabaseServices(uid: user.uid)
                              .updateMatchMode(
                                  'r4', true, true, false, 180, 'Game started');
                          print(Match.mid);
                          Match.mode = "r4";
                          //update the nested collection
                          await DatabaseServices(uid: user.uid)
                              .updateNestedplayers(
                                  Match.mid,
                                  name,
                                  null,
                                  true,
                                  5,
                                  0,
                                  0,
                                  user.uid,
                                  0,
                                  null,
                                  null,
                                  null,
                                  0,
                                  null,
                                  false,
                                  null,
                                  null,
                                  null,
                                  null);
                        } catch (e) {
                          print(e.toString());
                        }
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (_) {
                          return NormalFree4All();
                        }));
                      }
                    }
                    if (_survival) {
                      if (_twoteam) {
                        try {
                          User user = _auth.currentUser;

                          Match.mid = await DatabaseServices(uid: user.uid)
                              .updateMatchMode(
                                  's2', true, true, false, 180, 'Game started');
                          print(Match.mid);
                          Match.mode = "s2";
                          //update the nested collection
                          await DatabaseServices(uid: user.uid)
                              .updateNestedplayers(
                                  Match.mid,
                                  name,
                                  null,
                                  true,
                                  5,
                                  0,
                                  0,
                                  user.uid,
                                  0,
                                  null,
                                  null,
                                  null,
                                  0,
                                  null,
                                  false,
                                  null,
                                  null,
                                  null,
                                  null);
                        } catch (e) {
                          print(e.toString());
                        }
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (_) {
                          return Normal2Teams();
                        }));
                      }
                      if (_threeteam) {
                        print('Normal Three teams');
                        try {
                          User user = _auth.currentUser;

                          Match.mid = await DatabaseServices(uid: user.uid)
                              .updateMatchMode(
                                  's3', true, true, false, 180, 'Game started');
                          print(mid);

                          print(Match.mode);
                          Match.mode = "s3";
                          //update the nested collection
                          await DatabaseServices(uid: user.uid)
                              .updateNestedplayers(
                                  Match.mid,
                                  name,
                                  null,
                                  true,
                                  5,
                                  0,
                                  0,
                                  user.uid,
                                  0,
                                  null,
                                  null,
                                  null,
                                  0,
                                  null,
                                  false,
                                  null,
                                  null,
                                  null,
                                  null);
                        } catch (e) {
                          print(e.toString());
                        }
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (_) {
                          return Normal3Teams();
                        }));
                      }
                      if (_free4all) {
                        try {
                          User user = _auth.currentUser;

                          Match.mid = await DatabaseServices(uid: user.uid)
                              .updateMatchMode(
                                  's4', true, true, false, 180, 'Game started');

                          print(mid);
                          Match.mode = "s4";
                          //update the nested collection
                          await DatabaseServices(uid: user.uid)
                              .updateNestedplayers(
                                  Match.mid,
                                  name,
                                  null,
                                  true,
                                  5,
                                  0,
                                  0,
                                  user.uid,
                                  0,
                                  null,
                                  null,
                                  null,
                                  0,
                                  null,
                                  false,
                                  null,
                                  null,
                                  null,
                                  null);
                        } catch (e) {
                          print(e.toString());
                        }
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (_) {
                          return NormalFree4All();
                        }));
                      }
                    }
                  }),
            ),
          ),
          SizedBox(height: 50.0),
        ]),
      ),
    );
  }
}
