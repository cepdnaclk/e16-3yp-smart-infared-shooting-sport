import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xtag_demo/Developers/about_us.dart';
import 'package:xtag_demo/Developers/contact_us.dart';
import 'package:xtag_demo/Developers/offers_page.dar.dart';
import 'package:xtag_demo/Model/player.dart';
import 'package:xtag_demo/PlayModes/gun_connect.dart';
import 'package:xtag_demo/Player/player_details.dart';
import 'package:xtag_demo/Screens/sign_in.dart';
import 'package:xtag_demo/Services/auth.dart';
import 'package:xtag_demo/Services/database.dart';

class Home2 extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Player>>.value(
      value: DatabaseServices().players,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text(
              'X-TAG Shooter',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23.0),
            ),
            elevation: 0.0,
            actions: <Widget>[
              FlatButton.icon(
                icon: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                label: Text(
                  'Logout',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  await _auth.signOut();
                },
              )
            ],
          ),
          drawer: Theme(
            data: Theme.of(context)
                .copyWith(canvasColor: Colors.lightBlueAccent[200]),
            child: Drawer(
              child: Column(
                children: <Widget>[
                  Container(
                    child: UserAccountsDrawerHeader(
                      accountName: Text(
                        '   User',
                        style: TextStyle(fontSize: 20.0),
                      ),
                      currentAccountPicture: CircleAvatar(
                        backgroundColor: Colors.redAccent,
                        radius: 300.0,
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'Wellcome',
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'About us',
                      style: TextStyle(
                        fontSize: 22.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => AboutUs()),
                      );
                    },
                  ),
                  ListTile(
                    title: Text(
                      'Offers',
                      style: TextStyle(
                        fontSize: 22.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => OffersPage()),
                      );
                    },
                  ),
                  ListTile(
                    title: Text(
                      'Contact us',
                      style: TextStyle(
                        fontSize: 22.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => ContactUs()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          body: PlayerList()),
    );
  }
}
