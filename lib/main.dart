import 'package:new_app/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:new_app/widgets/SearchButton.dart';

import 'config/palette.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home : HomeScreen(),
    );
  }
}

