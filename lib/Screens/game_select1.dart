import 'package:flutter/material.dart';
import 'package:xtag_demo/Battle/creat_game.dart';
import 'package:xtag_demo/PlayModes/gun_connect.dart';
import 'package:xtag_demo/Player/player_details.dart';

import '../home.dart';
import 'home2.dart';

class GameSelect1 extends StatefulWidget {
  @override
  _GameSelect1State createState() => _GameSelect1State();
}

class _GameSelect1State extends State<GameSelect1> {
  bool creatGame = false;
  bool joinGame = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text('Play X-Tag gun'),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                  return Home();
                }));
              },
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                    height: 1000.0,
                    width: 500,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/back1.jpg'),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                            Colors.blueAccent.withOpacity(1.0),
                            BlendMode.dstIn),
                      ),
                    ),
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 80.0),
                        Text(
                          "Are you the Host",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        RaisedButton(
                          color: Colors.deepPurple[700],
                          elevation: 10.0,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: Colors.blue[800],
                              ),
                              borderRadius: BorderRadius.circular(20.0)),
                          child: Text(
                            '  Create  ',
                            style: TextStyle(fontSize: 20.0),
                          ),
                          onPressed: () async {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (_) {
                              return CreateGame();
                            }));
                          },
                        ),
                        SizedBox(height: 50.0),
                        Text(
                          "Or join a game",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        RaisedButton(
                          color: Colors.deepPurple[700],
                          elevation: 10.0,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: Colors.deepPurple[900],
                              ),
                              borderRadius: BorderRadius.circular(20.0)),
                          child: Text(
                            '  Join  ',
                            style: TextStyle(fontSize: 20.0),
                          ),
                          onPressed: () async {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (_) {
                              return Home2();
                            }));
                          },
                        ),
                        SizedBox(height: 50.0),
                      ],
                    )),
              ],
            ),
          )),
    );
  }
}
