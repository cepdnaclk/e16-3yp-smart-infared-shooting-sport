import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class Bluetooth extends StatefulWidget {
  @override
  _BluetoothState createState() => _BluetoothState();
}

class _BluetoothState extends State<Bluetooth> {
  FlutterBluetoothSerial _bluetooth = FlutterBluetoothSerial.instance;
  BluetoothConnection connection;
  BluetoothDevice mydevice;
  String op = "00 Foot";
  bool isConnectButtonEnabled = true;
  bool isDisConnectButtonEnabled = false;

  void _connect() async {
    List<BluetoothDevice> devices = [];
    setState(() {
      isConnectButtonEnabled = false;
      isDisConnectButtonEnabled = true;
    });
    devices = await _bluetooth.getBondedDevices();
    // ignore: unnecessary_statements
    devices.forEach((device) {
      print(device);
      if (device.name == "HC-05") {
        mydevice = device;
      }
    });

    await BluetoothConnection.toAddress(mydevice.address).then((_connection) {
      print('Connected to the device');

      connection = _connection;
    });

    connection.input.listen((Uint8List data) {
      print('Arduino Data : ${ascii.decode(data)}');
      //op = ascii.decode(data) + " Foot";
      setState(() {
        op = ascii.decode(data) + " Foot";
      });
    });
  }

  void _disconnect() {
    setState(() {
      op = "Disconnected";
      isConnectButtonEnabled = true;
      isDisConnectButtonEnabled = false;
    });
    connection.close();
    connection.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Flutter Arduino Demo",
          style: TextStyle(color: Colors.teal),
        ),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.grey[850],
      body: Column(
        children: [
          Text(
            "Please make sure you paired your HC-05, its default password is 1234",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.redAccent),
          ),
          Container(
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(15, 100, 0, 0),
                  child: FlatButton(
                    onPressed: isConnectButtonEnabled ? _connect : null,
                    child: Text("Connect HC-05"),
                    color: Colors.greenAccent,
                    disabledColor: Colors.grey,
                  ),
                ),
                SizedBox(
                  width: 25,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
                  child: FlatButton(
                    onPressed: isDisConnectButtonEnabled ? _disconnect : null,
                    child: Text("Disconnect HC-05"),
                    color: Colors.redAccent,
                    disabledColor: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 50),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                color: Colors.deepOrange,
                elevation: 10,
                child: Text(
                  "Output:",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 5,
                      color: Colors.amberAccent,
                      fontStyle: FontStyle.italic),
                ),
              ),
              Card(
                color: Colors.deepOrange,
                elevation: 10,
                child: Text(
                  "There is an object at ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.amberAccent),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Card(
                color: Colors.deepOrange,
                elevation: 10,
                child: Text(
                  "$op   ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.amberAccent),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Card(
                color: Colors.deepOrange,
                elevation: 10,
                child: Text(
                  "away from the Sensor!! ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.amberAccent),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
