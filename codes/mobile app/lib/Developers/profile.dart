import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:xtag_demo/Developers/played_match.dart';
import 'package:xtag_demo/Model/player1.dart';
import 'package:xtag_demo/Model/player_history.dart';
import 'package:xtag_demo/Services/auth.dart';

//final AuthService _auth = AuthService();

class PlayerProf extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();

    int battles_played = Player2.battlesplayed;

    int wins = Player2.wins;
    int deaths = Player2.deaths;
    int kills = Player2.kills;
    String rank = Player2.rank;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('Player Profile'),
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
                //mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      margin: const EdgeInsets.only(
                          top: 10.0, right: 90.0, left: 90.0),
                      child: Text(
                        Player1.name,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                        ),
                      )),
                  Container(
                      margin: const EdgeInsets.only(
                          top: 10.0, right: 90.0, left: 90.0),
                      child: Text(
                        Player1.uid,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10.0,
                        ),
                      )),
                  Container(
                      margin: const EdgeInsets.only(
                          top: 10.0, right: 50.0, left: 50.0),
                      child: Text(
                        "Total Battles Played: $battles_played",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                        ),
                      )),
                  Container(
                      margin: const EdgeInsets.only(
                          top: 10.0, right: 50.0, left: 50.0),
                      child: Text(
                        "Total Battles Won : $wins",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                        ),
                      )),
                  Container(
                      margin: const EdgeInsets.only(
                          top: 10.0, right: 50.0, left: 50.0),
                      child: Text(
                        "Rank : $rank",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                        ),
                      )),
                  Container(
                      margin: const EdgeInsets.only(
                          top: 10.0, right: 50.0, left: 50.0),
                      child: Text(
                        "Total Kills : $kills",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                        ),
                      )),
                  Container(
                      margin: const EdgeInsets.only(
                          top: 10.0, right: 50.0, left: 50.0),
                      child: Text(
                        "Total Deaths : $deaths",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                        ),
                      )),
                  Container(
                      margin: const EdgeInsets.only(
                          top: 5.0, right: 80.0, left: 80.0),
                      child: RaisedButton(
                        elevation: 10.0,
                        color: Colors.black54,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Colors.blue,
                            ),
                            borderRadius: BorderRadius.circular(30.0)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            const Icon(Icons.add,
                                size: 20.0, color: Colors.white),
                            const Text(
                              'Played Matches',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            ),
                          ],
                        ),
                        onPressed: () {
                          //Player1.name = name;
                          //user = auth.currentUser;
                          //print(user.email);
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (_) {
                            return PlayerProf();
                          }));
                        },
                      )),
                ])));
  }
}
