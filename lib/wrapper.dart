import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xtag_demo/Model/user.dart';
import 'package:xtag_demo/Screens/verify.dart';
import 'package:xtag_demo/authenticate.dart';
import 'package:xtag_demo/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserN>(context);
    print(user);
    // ignore: todo
    // TODO: implement build
    print(user);
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
