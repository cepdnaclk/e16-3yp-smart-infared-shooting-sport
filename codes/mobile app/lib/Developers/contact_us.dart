import 'package:flutter/material.dart';

class ContactUs extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact us'),
      ),
      body: ListView(
        children: <Widget>[
          Text('Page under Construction'),
          Container(
            height: 1000.0,
            color: Colors.red[300],
          ),
          Container(
            height: 1000.0,
            color: Colors.red[600],
          ),

        ],
      ),
    );
  }
}