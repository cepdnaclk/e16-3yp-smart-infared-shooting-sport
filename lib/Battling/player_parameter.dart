import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:xtag_demo/Model/match.dart';
import 'package:xtag_demo/Model/player1.dart';
import 'package:xtag_demo/Model/user.dart';

class PlayerParameters extends StatelessWidget {
  int count1 = 1;
  int number1;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('match')
          .doc(Match.mid)
          .collection('players')
          .doc(Player1.uid)
          .snapshots(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (!snapshot.hasData) return Text('Loading');
        var playerdata = snapshot.data;
        int health = playerdata['health'];
        return Container(
            margin: const EdgeInsets.only(top: 10.0, right: 20.0, left: 20.0),
            alignment: Alignment.center,
            //color: Colors.yellow,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.add_box_outlined,
                        size: 30.0,
                        color: health >= 1 ? Colors.white : Colors.red),
                    Icon(Icons.add_box_outlined,
                        size: 30.0,
                        color: health >= 2 ? Colors.white : Colors.red),
                    Icon(Icons.add_box_outlined,
                        size: 30.0,
                        color: health >= 3 ? Colors.white : Colors.red),
                    Icon(Icons.add_box_outlined,
                        size: 30.0,
                        color: health >= 4 ? Colors.white : Colors.red),
                    Icon(Icons.add_box_outlined,
                        size: 30.0,
                        color: health >= 5 ? Colors.white : Colors.red),
                    SizedBox(
                      width: 30.0,
                    ),
                    /*Icon(Icons.battery_charging_full_sharp,
                        size: 30.0,
                        color: ammocount >= 10 ? Colors.white : Colors.red),
                    Container(
                      margin: const EdgeInsets.only(right: 5.0, left: 5.0),
                      alignment: Alignment.center,
                      child: Text(
                        '$ammocount',
                        style: TextStyle(fontSize: 40, color: Colors.red),
                      ),
                    ),*/
                  ],
                ),
              ],
            ));
      },
    );
  }
}
