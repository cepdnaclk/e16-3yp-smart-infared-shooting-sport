import 'dart:core';

import 'package:flutter/material.dart';
import 'package:project/screens/until_join.dart';

class CreateGame extends StatefulWidget{
  @override
  _CreateGameState createState() => _CreateGameState();
}

class _CreateGameState extends State<CreateGame> {
  int _value;
  bool _normal= false;
  bool _rescue =false;
  bool _survival=false;
  bool _team = false;
  bool _free4all=false;
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Create New Battle'),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage('assets/backGroundImages/back1.jpg'),
        fit: BoxFit.cover,
        //colorFilter: ColorFilter.mode(Colors.black.withOpacity(1.7), BlendMode.dstATop)
        )
        ),
        //color: Colors.red[300],
        width: double.infinity,
        height:double.infinity,
        child: ListView(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top:30.0, right: 50.0, left:50.0),
                alignment: Alignment.center,
                child: Text(
                  "Now you can create game and join others",
                  style: TextStyle(fontSize: 12, color: Colors.yellow, ),
                )
              ),
              Container(
                  margin: const EdgeInsets.only(top:50.0, right: 20.0, left:20.0),
                  //alignment: Alig,
                  child: Text(
                    "Select the game mode",
                    style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold ),
                  )
              ),
              Container(
                margin: const EdgeInsets.only(top:30.0, right: 20.0, left:20.0),
                alignment: Alignment.center,
                child: Row(
                  children: <Widget>[
                    RaisedButton(
                      elevation: 10.0,
                      color: _normal?Colors.blue[900] : Colors.black54,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(30.0)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const Icon(
                              Icons.circle,
                              size: 10.0,
                              color: Colors.white
                          ),
                          const Text(
                            ' Normal',
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                        ],
                      ),
                      onPressed: (){
                        setState(() {
                          _normal= true;
                          _rescue= false;
                          _survival= false;
                        });
                      }
                    ),
                    Container(
                      width: 10.0,
                    ),
                    RaisedButton(
                      elevation: 10.0,
                      color: _survival?Colors.blue[900] : Colors.black54,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(30.0)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const Icon(
                              Icons.directions_run,
                              size: 10.0,
                              color: Colors.white
                          ),
                          const Text(
                            'Servival',
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                        ],
                      ),
                      onPressed: (){
                        setState(() {
                          _normal= false;
                          _rescue= false;
                          _survival= true;
                        });
                      }
                    ),
                    Container(
                      width: 10.0,
                    ),
                    RaisedButton(
                      elevation: 10.0,
                      color: _rescue?Colors.blue[900] : Colors.black54,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(30.0)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const Icon(
                              Icons.assistant_rounded,
                              size: 10.0,
                              color: Colors.white
                          ),
                          const Text(
                            'Rescue',
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                        ],
                      ),
                      onPressed: (){
                        setState(() {
                          _normal= false;
                          _rescue= true;
                          _survival=false;
                        });
                      }
                    ),
                  ],
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top:50.0, right: 20.0, left:20.0),
                  //alignment: Alig,
                  child: Text(
                    "Select the game type",
                    style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold ),
                  )
              ),

              Container(
                margin: const EdgeInsets.only(top:30.0, right: 10.0, left:20.0),
                alignment: Alignment.center,
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      height:100.0,
                      width: 150.0,
                      child: RaisedButton(
                          elevation: 10.0,
                          color: _team?Colors.blue[900] : Colors.black54,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: Colors.black,
                              ),
                              borderRadius: BorderRadius.circular(30.0)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              const Icon(
                                  Icons.group_outlined,
                                  size: 30.0,
                                  color: Colors.white
                              ),
                              const Text(
                                '  Team',
                                style: TextStyle(fontSize: 20, color: Colors.white),
                              ),
                            ],
                          ),
                          onPressed: (){
                            setState(() {
                              _team= true;
                              _free4all= false;
                            });
                          }
                      ),
                    ),
                    Container(
                      width: 10.0,
                    ),
                    SizedBox(
                      height:100.0,
                      width: 150.0,
                      child: RaisedButton(
                          elevation: 10.0,
                          color: _free4all?Colors.blue[900] : Colors.black54,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: Colors.black,
                              ),
                              borderRadius: BorderRadius.circular(30.0)

                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              const Icon(
                                  Icons.account_circle,
                                  size: 25.0,
                                  color: Colors.white
                              ),
                              const Text(
                                'Free for all',
                                style: TextStyle(fontSize: 18, color: Colors.white),
                              ),
                            ],
                          ),
                          onPressed: (){
                            setState(() {
                              _team= false;
                              _free4all= true;
                            });
                          }
                      ),
                    ),

                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top:30.0, right: 10.0, left:20.0),
                alignment: Alignment.center,
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      height:50.0,
                      width: 120.0,
                      child: RaisedButton(
                          elevation: 10.0,
                          color:  Colors.black12,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: Colors.black,
                              ),
                              borderRadius: BorderRadius.circular(30.0)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[

                              const Text(
                                '  2 Teams',
                                style: TextStyle(fontSize: 18, color: Colors.white),
                              ),
                            ],
                          ),
                          onPressed: (){
                            setState(() {
                              _team= false;
                              _free4all= false;
                            });
                          }
                      ),
                    ),
                    Container(
                      width: 10.0,
                    ),
                    SizedBox(
                      height:50.0,
                      width: 120.0,
                      child: RaisedButton(
                          elevation: 10.0,
                          color: _team?Colors.blue[900] : Colors.black12,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: Colors.black,
                              ),
                              borderRadius: BorderRadius.circular(30.0)

                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              const Text(
                                '3 Teams',
                                style: TextStyle(fontSize: 18, color: Colors.white),
                              ),
                            ],
                          ),
                          onPressed: (){
                            setState(() {
                              _team= true;
                              _free4all= false;
                            });
                          }
                      ),
                    ),

                  ],
                ),
              ),
              Container(
                height:50.0
              ),
              Container(
                height:50.0,
                margin: const EdgeInsets.only(top:30.0, right: 10.0, left:20.0),
                alignment: Alignment.center,
                child: SizedBox(
                  height:100.0,
                  width: 260.0,
                  child: RaisedButton(
                      elevation: 10.0,
                      color: Colors.green[600],
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(30.0)

                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const Icon(
                              Icons.account_circle,
                              size: 25.0,
                              color: Colors.white
                          ),
                          const Text(
                            'Create Battle',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ],
                      ),
                      onPressed: (){
                        if((_rescue || _survival || _normal)==true){
                          if(_team==true){
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_){
                                  return WaitingPage();
                                }
                            ),
                            );
                          }
                        }
                      }
                  ),
                ),
              ),
          ]
        ),
      ),

    );
  }
}