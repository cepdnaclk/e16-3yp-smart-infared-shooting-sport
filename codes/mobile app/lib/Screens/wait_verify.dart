import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:xtag_demo/Services/auth.dart';

class WaitingToVerify extends StatelessWidget {
  final auth = FirebaseAuth.instance;
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/back1.jpg'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
              Colors.blueAccent.withOpacity(1.0), BlendMode.dstIn),
        ),
      ),
      child: Column(
        children: [
          Text('Check email and verify'),
          SizedBox(height: 20.0),
          RaisedButton(
            color: Colors.blue[500],
            elevation: 10.0,
            shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Colors.blue[800],
                ),
                borderRadius: BorderRadius.circular(20.0)),
            child: Text(
              '  Verified  ',
              style: TextStyle(fontSize: 20.0),
            ),
            onPressed: () async {
              await _auth.signOut();
            },
          ),
        ],
      ),
    );
  }
}
