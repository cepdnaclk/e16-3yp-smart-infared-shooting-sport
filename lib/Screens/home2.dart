import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xtag_demo/Developers/about_us.dart';
import 'package:xtag_demo/Developers/contact_us.dart';
import 'package:xtag_demo/Developers/offers_page.dar.dart';
import 'package:xtag_demo/Model/player.dart';
import 'package:xtag_demo/PlayModes/gun_connect.dart';
import 'package:xtag_demo/Screens/sign_in.dart';
import 'package:xtag_demo/Services/auth.dart';
import 'package:xtag_demo/Services/database.dart';

class Home extends StatelessWidget {
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
                height: 10.0,
              ),
              Image(
                image: AssetImage('assets/gun1_main.jpg'),
                height: 80.0,
              ),
              Text(
                "X-TAG",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Lobster',
                    fontSize: 60.0,
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
                height: 15.0,
              ),
              Image(
                image: AssetImage('assets/gun2_home.jpg'),
                height: 180.0,
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                  margin:
                      const EdgeInsets.only(top: 5.0, right: 80.0, left: 80.0),
                  child: RaisedButton(
                    elevation: 10.0,
                    color: Colors.black54,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.blue,
                        ),
                        borderRadius: BorderRadius.circular(30.0)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const Icon(Icons.add, size: 20.0, color: Colors.white),
                        const Text(
                          'Connect Gun',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ],
                    ),
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) {
                        return BluetoothApp();
                      }));
                    },
                  )),
              Container(
                  margin:
                      const EdgeInsets.only(top: 5.0, right: 80.0, left: 80.0),
                  child: RaisedButton(
                    elevation: 10.0,
                    color: Colors.black54,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.blue,
                        ),
                        borderRadius: BorderRadius.circular(30.0)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const Icon(Icons.add, size: 20.0, color: Colors.white),
                        const Text(
                          'Connect Gun',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ],
                    ),
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) {
                        return SignIn();
                      }));
                    },
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
