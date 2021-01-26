import 'package:flutter/material.dart';

import 'creat_game.dart';

class Normal3Teams extends StatefulWidget {
  @override
  _Normal3TeamsState createState() => _Normal3TeamsState();
}

class _Normal3TeamsState extends State<Normal3Teams> {
  bool _fives = false;
  bool _tens = false;
  bool _twentys = false;
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
                return CreateGame();
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
                //mainAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 20.0, left: 20.0),
                    child: Row(
                      children: [
                        Container(
                            margin: const EdgeInsets.only(
                                top: 25.0, right: 5.0, left: 10.0),
                            child: RaisedButton(
                                elevation: 50.0,
                                color:
                                    _fives ? Colors.blue[900] : Colors.black54,
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
                                      '5s',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.white),
                                    ),
                                  ],
                                ),
                                onPressed: () {
                                  setState(() {
                                    _fives = true;
                                    _tens = false;
                                    _twentys = false;
                                  });
                                })),
                        Container(
                            margin: const EdgeInsets.only(
                                top: 25.0, right: 5.0, left: 10.0),
                            child: RaisedButton(
                                elevation: 50.0,
                                color:
                                    _tens ? Colors.blue[900] : Colors.black54,
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
                                      '10s',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.white),
                                    ),
                                  ],
                                ),
                                onPressed: () {
                                  setState(() {
                                    _fives = false;
                                    _tens = true;
                                    _twentys = false;
                                  });
                                })),
                        Container(
                            margin: const EdgeInsets.only(
                                top: 25.0, right: 5.0, left: 10.0),
                            child: RaisedButton(
                                elevation: 50.0,
                                color: _twentys
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
                                      '20s',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.white),
                                    ),
                                  ],
                                ),
                                onPressed: () {
                                  setState(() {
                                    _fives = false;
                                    _tens = false;
                                    _twentys = true;
                                  });
                                })),
                      ],
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.only(
                          top: 25.0, right: 80.0, left: 80.0),
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
                                'Battle Begin',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                            ],
                          ),
                          onPressed: () {})),
                ],
              ),
            ),
          ]),
        ));
  }
}
