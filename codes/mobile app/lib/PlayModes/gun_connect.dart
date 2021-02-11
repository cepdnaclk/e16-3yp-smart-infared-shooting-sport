import 'package:flutter/material.dart';
import 'package:xtag_demo/Screens/game_select1.dart';
//import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class BluetoothApp extends StatefulWidget {
  @override
  _BluetoothAppState createState() => _BluetoothAppState();
}

class _BluetoothAppState extends State<BluetoothApp> {
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  String gunid;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('Coonct X-Tag gun'),
        ),
        body: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/back1.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.blueAccent.withOpacity(1.0), BlendMode.dstIn),
            ),
          ),
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(height: 30.0),
                TextFormField(
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                  decoration: InputDecoration(hintText: 'Gun ID'),
                  validator: (val) =>
                      val.length == 0 ? 'Gun Id is incorrect' : null,
                  onChanged: (val) {
                    setState(() => gunid = val);
                  },
                ),
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
                    '  SignIn  ',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  onPressed: () async {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                      return GameSelect1();
                    }));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
