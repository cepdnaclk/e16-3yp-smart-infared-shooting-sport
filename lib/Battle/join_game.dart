import 'package:flutter/material.dart';
import 'package:xtag_demo/Battle/waiting_join_2teams.dart';
import 'package:xtag_demo/Battle/waiting_join_3teams.dart';
import 'package:xtag_demo/Screens/game_select1.dart';

class JoinGame extends StatefulWidget {
  @override
  _JoinGameState createState() => _JoinGameState();
}

class _JoinGameState extends State<JoinGame> {
  String _matchid;
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
                Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                  return Join2Teams();
                }));
              },
            ),
          ]),
        ));
  }
}
