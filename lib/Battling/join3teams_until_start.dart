import 'package:flutter/material.dart';

class Join3teamsUntilStart extends StatefulWidget {
  @override
  _Join3teamsUntilStartState createState() => _Join3teamsUntilStartState();
}

class _Join3teamsUntilStartState extends State<Join3teamsUntilStart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Wait until the host start play '),
      ),
    );
  }
}
