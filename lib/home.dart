import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xtag_demo/Services/auth.dart';
import 'Model/player.dart';
import 'Model/player1.dart';
import 'Model/user.dart';
import 'PlayModes/gun_connect.dart';
import 'Services/database.dart';
import 'package:provider/provider.dart';
import 'Developers/about_us.dart';
import 'Developers/contact_us.dart';
import 'Developers/offers_page.dar.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    //final user = Provider.of<UserN>(context);
    final auth = FirebaseAuth.instance;
    String uid;
    User user;
    user = auth.currentUser;
    String emailC = 'No User';
    String name = 'null';
    //Player1.uid = uid;
    //print(Player1.uid);
    if (user != null) {
      emailC = user.email;
      uid = user.uid;
      Player1.uid = uid;
      // print(Player1.uid);
      FirebaseFirestore.instance
          .collection('player')
          .doc(uid)
          .get()
          .then((DocumentSnapshot documentSnapshot) {
        //print("Vira0");
        //print(documentSnapshot['name']);
        name = documentSnapshot['name'];
        Player1.name = name;
      });
    }
    //print(emailC);
    //print(emailC);
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
                //user = auth.currentUser;
                //print(user);
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
                      Player1.name,
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
                      //Player1.name = name;
                      //user = auth.currentUser;
                      //print(user.email);
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) {
                        return BluetoothApp();
                      }));
                    },
                  )),
              /*Container(
                  margin:
                      const EdgeInsets.only(top: 5.0, right: 80.0, left: 80.0),
                  child: RaisedButton(
                    elevation: 10.0,
                    color: Colors.green,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.blue,
                        ),
                        borderRadius: BorderRadius.circular(30.0)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const Icon(Icons.person,
                            size: 20.0, color: Colors.white),
                        const Text(
                          'Log In here',
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
                  )),*/
            ],
          ),
        ),
      ),
    );
  }
}
