import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

import 'screens/home_page.dart';
import 'screens/login_page.dart';

main()=> runApp(
  DevicePreview(
    builder: (context) => MyApp(),
),
);

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //locale: DevicePreview.of(context).locale, // <--- /!\ Add the locale
      //builder: DevicePreview.appBuilder, // <--- /!\ Add the builder
      title:'Infared Shooter',
      //home: MyHomePage(
       // title: 'Infared Shooter demo'
     // ),
      home: MyHomePage(title: "Infared Shooter"),
    );
  }
}
