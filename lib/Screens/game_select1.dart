import 'package:flutter/material.dart';
import 'package:xtag_demo/PlayModes/gun_connect.dart';

class GameSelect1 extends StatefulWidget {
  @override
  _GameSelect1State createState() => _GameSelect1State();
}

class _GameSelect1State extends State<GameSelect1> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('Play X-Tag gun'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                return BluetoothApp();
              }));
            },
          ),
        ),
      ),
    );
  }
}
