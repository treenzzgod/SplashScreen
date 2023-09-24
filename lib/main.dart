import 'package:flutter/material.dart';

import 'package:splashscreen/pages/pemasukanp.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Pemasukanp(),
        ),
        theme: ThemeData(
          primarySwatch: Colors.green,
        ));
  }
}
