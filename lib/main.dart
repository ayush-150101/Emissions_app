import 'package:emission_2_app/InfoScreen1.dart';
import 'package:emission_2_app/LoadingScreen1.dart';
import 'package:emission_2_app/LoadingScreen2.dart';
import 'package:flutter/material.dart';

import 'Loading.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      title: 'Flutter Demo',
      home: Loading(),
      routes: {
        '/LS1':(context)=>LoadingScreen1(),
        '/LS2':(context)=>LoadingScreen2(),
        '/IS1':(context)=>InfoScreen1(),
        //'/IS2':(context)=>InfoScreen2(),
      },
    );
  }
}

