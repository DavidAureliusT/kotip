import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => Home(),
        // '/first': (context) => Login(),
      },
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
    );
  }
}