import 'package:day4/pages/StarterPage.dart';
import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        home: Scaffold(
          body: StarterPage(),
        ),
      ),
    );
