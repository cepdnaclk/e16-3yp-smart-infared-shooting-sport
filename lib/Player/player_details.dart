import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:xtag_demo/Model/player.dart';

import '../home.dart';

class PlayerList extends StatefulWidget {
  @override
  _PlayerListState createState() => _PlayerListState();
}

class _PlayerListState extends State<PlayerList> {
  @override
  Widget build(BuildContext context) {
    final players = Provider.of<List<Player>>(context);
    final auth = FirebaseAuth.instance;
    User user;
    user = auth.currentUser;

    players.forEach((player) {
      print(player.email);
    });

    return Container(
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
    );
  }
}
