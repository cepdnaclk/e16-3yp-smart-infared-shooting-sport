import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xtag_demo/Model/user.dart';
import 'package:xtag_demo/Screens/verify.dart';
import 'package:xtag_demo/authenticate.dart';
import 'package:xtag_demo/home.dart';

import 'Screens/wait_verify.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserN>(context);
    final auth = FirebaseAuth.instance;

    // ignore: todo
    // TODO: implement build
    //print(userv.emailVerified);
    if (user == null) {
      return Authenticate();
    } else {
      final auth = FirebaseAuth.instance;
      User userv;
      userv = auth.currentUser;
      print(userv);
      bool verify = false;
      if (userv != null) {
        verify = userv.emailVerified;
      }
      if (verify) {
        return Home();
      } else {
        return Authenticate();
      }
    }
  }
}
