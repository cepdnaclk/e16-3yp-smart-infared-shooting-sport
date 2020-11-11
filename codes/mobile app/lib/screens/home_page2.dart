import 'package:flutter/material.dart';

import 'creat_game.dart';

class HomePage2 extends StatefulWidget{
  @override
  _HomePage2State createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2>{
  @override

  Widget _discription(){
    return Container(
      margin: const EdgeInsets.only(top: 10,left: 20,right: 20),
      child: Column(
        children:[

          Text(
            'Feel the ',
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'Lobster',
                fontSize: 50.0,
                fontWeight: FontWeight.bold
            ),
          ),
          Text(
            'Experiance of',
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'Lobster',
                fontSize: 50.0,
                fontWeight: FontWeight.bold
            ),
          ),
          Text(
            'Real Battle',
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'Lobster',
                fontSize: 50.0,
                fontWeight: FontWeight.bold
            ),
          ),

        ],
      ),
    );
  }

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Smaart X-Tag'),
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

        child: ListView(
          children: <Widget>[
            Container(
              height: 20.0,
            ),
            Container(
              child:Image(
                image: AssetImage(
                    'assets/backGroundImages/gun1_main.jpg'
                ),
                height: 100.0,
              )
            ),
            _discription(),
            Container(
              height:80.0,
              margin: const EdgeInsets.only(top:50.0, right: 50.0, left:50.0),
              //color: Colors.red[600],
              child: RaisedButton(
                elevation: 10.0,
                color: Colors.black,
                shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.circular(20.0)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Icon(
                      Icons.group_add,
                      size: 50.0,
                      color: Colors.white
                    ),
                    const Text(
                      '   Join Battle',
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    ),
                  ],
                ),
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_){
                        return CreateGame();
                      }
                  )
                  );
                },
              ),
            ),

            Container(
              height:40.0
            ),

            Container(
              margin: const EdgeInsets.only(left:50.0 , right: 50.0),
              height:80.0,
              //color: Colors.red[600],
              child: RaisedButton(
                elevation: 10.0,
                color: Colors.black,
                shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(20.0)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Icon(
                        Icons.create,
                        size: 40.0,
                        color: Colors.white
                    ),
                    const Text(
                      '   Create Battle',
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    ),
                  ],
                ),
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (_){
                      return CreateGame();
                    }
                    )
                  );
                },
              ),
            ),
            Container(
              height: 100.0,
              child: Text(
                ""
              )
            ),

          ],
        ),
      ),
    );
  }
}