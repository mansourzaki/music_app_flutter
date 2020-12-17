import 'package:flutter/material.dart';
import 'package:music_app/screens/homepage_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music App',
      theme: ThemeData(
        primaryColor: Colors.black,
        accentColor: Colors.red[600],
        iconTheme: IconThemeData(color: Colors.red[600]),
        
      ),
      home: HomePageScreen(),
    );
  }
}
