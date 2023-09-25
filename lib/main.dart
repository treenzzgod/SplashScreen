import 'package:flutter/material.dart';
import 'package:splashscreen/pages/cash.dart';
import 'package:splashscreen/pages/cashflow.dart';
import 'package:splashscreen/pages/pages.dart';
import 'package:splashscreen/Comm/datepicker.dart';
import 'package:splashscreen/pages/pemasukanp.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tambahkan Item',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Home(),
    );
  }
}
