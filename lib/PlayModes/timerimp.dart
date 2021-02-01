import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:xtag_demo/Model/match.dart';
import 'package:xtag_demo/Model/player1.dart';
import 'package:xtag_demo/Results/result_team3_normal.dart';
import 'package:xtag_demo/Services/database.dart';
import 'package:xtag_demo/TeamSocres/team1.dart';
import 'package:xtag_demo/TeamSocres/team2.dart';
import 'package:xtag_demo/TeamSocres/team3.dart';

class TimerImp extends StatefulWidget {
  @override
  _TimerImpState createState() => _TimerImpState();
}

class _TimerImpState extends State<TimerImp> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  CountDownController _controller = CountDownController();
  int _duration = 180;
  @override
  Widget build(BuildContext context) {
    //_controller.start();
    return Container(
      alignment: Alignment.center,
      //width: double.infinity,
      //height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/back1.jpg'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
              Colors.blueAccent.withOpacity(1.0), BlendMode.dstIn),
        ),
      ),
      child: Center(
          child: CircularCountDownTimer(
              // Countdown duration in Seconds.
              duration: _duration,

              // Controls (i.e Start, Pause, Resume, Restart) the Countdown Timer.
              controller: _controller,

              // Width of the Countdown Widget.
              width: 70.0,

              // Height of the Countdown Widget.
              height: 70.0,

              // Ring Color for Countdown Widget.
              color: Colors.black,

              // Filling Color for Countdown Widget.
              fillColor: Colors.yellow[700],

              // Background Color for Countdown Widget.
              backgroundColor: Colors.yellow[800],

              // Border Thickness of the Countdown Ring.
              strokeWidth: 1.0,

              // Begin and end contours with a flat edge and no extension.
              strokeCap: StrokeCap.round,

              // Text Style for Countdown Text.
              textStyle: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),

              // Format for the Countdown Text.
              textFormat: CountdownTextFormat.SS,

              // Handles Countdown Timer (true for Reverse Countdown (max to 0), false for Forward Countdown (0 to max)).
              isReverse: true,

              // Handles Animation Direction (true for Reverse Animation, false for Forward Animation).
              isReverseAnimation: true,

              // Handles visibility of the Countdown Text.
              isTimerTextShown: true,

              // Handles the timer start.
              autoStart: true,

              // This Callback will execute when the Countdown Starts.
              onStart: () {
                // Here, do whatever you want
                print('Countdown Started');
              },

              // This Callback will execute when the Countdown Ends.
              onComplete: () async {
                //IMPEMENT HEARE THE MATCH FINISHED function
                // Here, do whatever you want
                //print(isBattlefinished);
                Team1.score = 0;
                Team1.deaths = 0;
                Team1.kills = 0;
                Team2.score = 0;
                Team2.deaths = 0;
                Team2.kills = 0;
                Team3.score = 0;
                Team3.deaths = 0;
                Team3.kills = 0;
                try {
                  User user = _auth.currentUser;
                  await DatabaseServices(uid: user.uid)
                      .upadtenestedmatchisreadyfalse(Match.mid);
                } catch (e) {
                  print(e.toString());
                }
                await FirebaseFirestore.instance
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
                await FirebaseFirestore.instance
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
                await FirebaseFirestore.instance
                    .collection('match')
                    .doc(Match.mid)
                    .collection('players')
                    .orderBy('score', descending: true)
                    .get()
                    .then((QuerySnapshot querySnapshot) => {
                          Match.pom = querySnapshot.docs[0]['name'],
                          Match.poms = querySnapshot.docs[0]['score']
                        });

                print('battle Ended');
                Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                  print('sdds');
                  print(Match.pom);
                  print(Match.poms);
                  return Result3teamNormal();
                }));
                print('Countdown Ended');
              })),
      //RaisedButton(onPressed: () {  },),
      /*floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 30,
          ),
          _button(title: "Start", onPressed: () => _controller.start()),
          SizedBox(
            width: 10,
          ),
        ],
      ),**/
    );
  }
}
