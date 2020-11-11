import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/screens/contact_us.dart';
import 'package:project/screens/offers_page.dar.dart';

import 'about_us.dart';
import 'login_page.dart';
import 'screen1.dart';
import 'offers_page.dar.dart';
import 'contact_us.dart';


class MyHomePage extends StatefulWidget{
  MyHomePage({this.title});
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'X-TAG Shooter',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23.0 ),
        ),

        backgroundColor: Colors.black,
      ),
      drawer: Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.lightBlueAccent[200]),
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
                    fontSize:25.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  'About us',
                  style: TextStyle(
                    fontSize:22.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: (){
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context)=> AboutUs()
                    ),
                  );
                },
              ),
              ListTile(
                title: Text(
                  'Offers',
                  style: TextStyle(
                    fontSize:22.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: (){
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context)=> OffersPage()
                    ),
                  );
                },
              ),
              ListTile(
                title: Text(
                  'Contact us',
                  style: TextStyle(
                    fontSize:22.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: (){
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context)=> ContactUs()
                    ),
                  );
                },
              ),
              ListTile(
                title: Text(
                  'Sign Out',
                  style: TextStyle(
                    fontSize:23.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: (){
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context)=> FirstScreen()
                    ),
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
              image: AssetImage('assets/backGroundImages/back1.jpg'),
              fit: BoxFit.cover,
              //colorFilter: ColorFilter.mode(Colors.black.withOpacity(1.7), BlendMode.dstATop)
            )
        ),
        //color: Colors.red[300],
        width: double.infinity,
        height:double.infinity,
        child: Column(
          children:<Widget>[
            SizedBox(
              height: 20.0,
            ),
            Image(
              image: AssetImage(
                'assets/backGroundImages/gun1_main.jpg'
              ),
              height: 100.0,
            ),
            Text(
              "X-TAG",
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Lobster',
                  fontSize: 70.0,
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(
              height:10.0,
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
              height:20.0,
            ),
            Image(
              image: AssetImage(
                  'assets/backGroundImages/gun2_home.jpg'
              ),
              height: 180.0,
            ),
            SizedBox(
              height:70.0,
            ),
            RawMaterialButton(
              fillColor: Colors.lightBlueAccent,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 20.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Icon(
                      Icons.account_circle_sharp,
                      size: 30.0,
                    ),
                    const Text(
                      'Login here',
                      style: TextStyle(fontSize: 22),
                    ),
                  ],
                ),
              ),
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_){
                      return LoginPage();
                    }
                ));
              },
            ),

          ],
        ),
       ),

    );
  }
}