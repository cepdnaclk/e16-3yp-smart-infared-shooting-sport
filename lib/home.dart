import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xtag_demo/Services/auth.dart';
import 'Services/database.dart';
import 'package:provider/provider.dart';
import 'Developers/about_us.dart';
import 'Developers/contact_us.dart';
import 'Developers/offers_page.dar.dart';
import 'Player/player_details.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot>.value(
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
                  child: PlayerList(),
                ),
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
        body: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/back1.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              Image(
                image: AssetImage('assets/gun1_main.jpg'),
                height: 100.0,
              ),
              Text(
                "X-TAG",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Lobster',
                    fontSize: 70.0,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "Smart infrared shooting sport",
                style: TextStyle(
                  color: Colors.white,
                  //fontFamily: 'Lobster',
                  fontSize: 23.0,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Image(
                image: AssetImage('assets/gun2_home.jpg'),
                height: 180.0,
              ),
              SizedBox(
                height: 30.0,
              ),
              RawMaterialButton(
                fillColor: Colors.lightBlueAccent,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 17.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Text(
                        'Play Now',
                        style: TextStyle(fontSize: 22),
                      ),
                    ],
                  ),
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
