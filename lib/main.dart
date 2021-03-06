import 'package:flutter/material.dart';
import 'package:mortage_calculator/home.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MortageApp(),
      theme: ThemeData(
          primaryColor: Colors.deepPurple.shade900,
          secondaryHeaderColor: Colors.cyan,
          textTheme: TextTheme(
            headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
            bodyText2: TextStyle(
              fontSize: 14.0,
            ),
          ),
          backgroundColor: Colors.cyan),
    ));
