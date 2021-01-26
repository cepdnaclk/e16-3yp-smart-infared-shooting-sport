import 'package:flutter/material.dart';

import 'creat_game.dart';

class Normal2Teams extends StatefulWidget {
  @override
  _Normal2TeamsState createState() => _Normal2TeamsState();
}

class _Normal2TeamsState extends State<Normal2Teams> {
  @override
  Widget build(BuildContext context) {
    String matchid;
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
    );
  }
}
