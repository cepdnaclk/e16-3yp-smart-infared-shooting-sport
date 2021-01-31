import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:xtag_demo/Battle/waiting_join_%20free4all.dart';
import 'package:xtag_demo/Battle/waiting_join_2teams.dart';
import 'package:xtag_demo/Battle/waiting_join_3teams.dart';
import 'package:xtag_demo/Model/match2.dart';
import 'package:xtag_demo/Model/player1.dart';
import 'package:xtag_demo/Screens/game_select1.dart';
import 'package:xtag_demo/Services/database.dart';
import 'package:xtag_demo/Model/match.dart';

class JoinGame extends StatefulWidget {
  @override
  _JoinGameState createState() => _JoinGameState();
}

final FirebaseAuth _auth = FirebaseAuth.instance;

class _JoinGameState extends State<JoinGame> {
  String _matchid;
  String name = Player1.name;
  String mode;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('Join X Tag Battle'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                return GameSelect1();
              }));
            },
          ),
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
          child: Column(children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 50.0, right: 20.0, left: 20.0),
              color: Colors.white60,
              child: TextFormField(
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17.0,
                ),
                decoration: InputDecoration(hintText: 'Match ID'),
                validator: (val) => val.isEmpty ? 'Enter an Match ID' : null,
                onChanged: (val) {
                  setState(() => _matchid = val);
                },
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            RaisedButton(
              color: Colors.blueAccent[400],
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
                //add data to the game
                Match.mid = _matchid;
                print('hjhajskjjkasjkas');
                print(Match.mid);

                try {
                  User user = _auth.currentUser;
                  print(_matchid);
                  //update the nested collection
                  await DatabaseServices(uid: user.uid).updateNestedplayers(
                      _matchid,
                      name,
                      null,
                      true,
                      5,
                      0,
                      0,
                      360,
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
                Match2.mid2 = _matchid;
                try {
                  print(_matchid);
                  await FirebaseFirestore.instance
                      .collection('match')
                      .doc(_matchid)
                      .get()
                      .then((DocumentSnapshot documentSnapshot) {
                    print("Vira0");
                    print(documentSnapshot['mode']);
                    Match.mode = documentSnapshot['mode'];
                    mode = documentSnapshot['mode'];
                  });
                } catch (e) {
                  print(e.toString());
                  print("error");
                }
                try {
                  if (mode == 'n3' || mode == 'r3' || mode == 's3') {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                      return Join3Teams();
                    }));
                  }
                  if (Match.mode == 'n2' || mode == 'r2' || mode == 's2') {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                      return Join2Teams();
                    }));
                  }
                  if (mode == 'n4' || mode == 'r4' || mode == 's4') {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                      return Joinfre4all();
                    }));
                  }
                } catch (e) {
                  print(e.toString());
                }
                /*Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                  return Join2Teams();
                }));*/
                print(Match.mid);
              },
            ),
          ]),
        ));
  }
}
