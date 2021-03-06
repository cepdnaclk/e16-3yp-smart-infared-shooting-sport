//import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
// For using PlatformException
import 'package:flutter/services.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:xtag_demo/Model/player1.dart';

class BluetoothServices {
  BluetoothServices();
  FlutterBluetoothSerial _bluetooth = FlutterBluetoothSerial.instance;

  BluetoothConnection connection = Player1.conect;
  bool get isConnected => connection != null && connection.isConnected;

  write(String message) async {
    print(connection.isConnected);
    if (connection.isConnected) {
      connection.output.add(utf8.encode(message + "\r\n"));
      print("sent");
    } else {
      print("not connected");
    }
  }
}
