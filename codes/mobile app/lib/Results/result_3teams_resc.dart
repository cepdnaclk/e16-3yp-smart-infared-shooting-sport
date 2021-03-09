import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:xtag_demo/Model/match.dart';
import 'package:xtag_demo/Model/player1.dart';
import 'package:xtag_demo/TeamSocres/team1.dart';
import 'package:xtag_demo/TeamSocres/team2.dart';
import 'package:xtag_demo/TeamSocres/team3.dart';

class Result3teamResc extends StatefulWidget {
  @override
  _Result3teamRescState createState() => _Result3teamRescState();
}

class _Result3teamRescState extends State<Result3teamResc> {
  final auth = FirebaseAuth.instance;

  int score1 = 20;

  int score2 = 12;

  int totalKills1 = 4;

  int totalKills2 = 5;

  int totalDeaths1 = 4;

  int totalDeaths2 = 5;

  String pof = 'Balla';

  int pofs = 6;

  String mok = 'Ura';

  int moks = 6;

  int deaths;

  @override
  Widget build(BuildContext context) {
    int score;
    FirebaseFirestore.instance
        .collection('match')
        .doc(Match.mid)
        .collection('players')
        .doc(Player1.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      Player1.deaths = documentSnapshot['deaths'];
      Player1.kills = documentSnapshot['kills'];
      Player1.score = documentSnapshot['score'];
    });
    FirebaseFirestore.instance
        .collection('match')
        .doc(Match.mid)
        .collection('players')
        .get()
        .then((QuerySnapshot querySnapshot) => {
              querySnapshot.docs.forEach((doc) {
                if (doc['team'] == 1) {
                  Team1.score = Team1.score + doc['score'];
                  Team1.deaths = Team1.deaths + doc['deaths'];
                  Team1.kills = Team1.kills + doc['kills'];
                }
                if (doc['team'] == 2) {
                  Team2.score = Team2.score + doc['score'];
                  Team2.deaths = Team2.deaths + doc['deaths'];
                  Team2.kills = Team2.kills + doc['kills'];
                }
                if (doc['team'] == 3) {
                  Team3.score = Team3.score + doc['score'];
                  Team3.deaths = Team3.deaths + doc['deaths'];
                  Team3.kills = Team3.kills + doc['kills'];
                }
              })
            });
    print(Player1.score);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('XTag Battle Result'),
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
        child: ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin:
                      const EdgeInsets.only(top: 20.0, right: 0.0, left: 10.0),
                  height: 170.0,
                  width: 100,
                  color: Colors.green[900],
                  child: Column(
                    children: [
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        "Team 1",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          //fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        Team1.score.toString(),
                        style: TextStyle(
                          fontSize: 23,
                          color: Colors.black,
                          //fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        Team1.kills.toString(),
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          //fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        Team1.deaths.toString(),
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          //fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.only(top: 20.0, right: 0.0, left: 10.0),
                  height: 170.0,
                  width: 100,
                  color: Colors.green[900],
                  child: Column(
                    children: [
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        "Team 2",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          //fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        Team2.score.toString(),
                        style: TextStyle(
                          fontSize: 23,
                          color: Colors.black,
                          //fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        Team2.kills.toString(),
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          //fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        Team2.deaths.toString(),
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          //fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.only(top: 20.0, right: 0.0, left: 10.0),
                  height: 170.0,
                  width: 100,
                  color: Colors.green[900],
                  child: Column(
                    children: [
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        "Team 3",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          //fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        Team3.score.toString(),
                        style: TextStyle(
                          fontSize: 23,
                          color: Colors.black,
                          //fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        Team3.kills.toString(),
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          //fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        Team3.deaths.toString(),
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          //fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 25.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Player of the match  :"),
                Text('$pof with $pofs points'),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Most kills  :"),
                Text(' $mok with $moks points'),
              ],
            ),
            SizedBox(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Yor Statics oof the match",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    //fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5.0,
            ),
            Container(
              margin: const EdgeInsets.only(top: 0.0, right: 50.0, left: 50.0),
              width: 300.0,
              height: 100.0,
              color: Colors.black,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 7.0,
                      ),
                      Text(
                        "Score",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          //fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Kills",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          //fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Deaths",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          //fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Kills per Death",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          //fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Percentage of Kills",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          //fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Percentage of Deaths",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          //fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 7.0,
                      ),
                      Text(
                        ":",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          //fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        ":",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          //fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        ":",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          //fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        ":",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          //fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        ":",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          //fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        ":",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          //fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 7.0,
                      ),
                      Text(
                        Player1.score.toString(),
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          //fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        Player1.kills.toString(),
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          //fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        Player1.deaths.toString(),
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          //fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        ((Player1.kills / Player1.deaths).toString()),
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          //fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        ":",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          //fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        ":",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          //fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
