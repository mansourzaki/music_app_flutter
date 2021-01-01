import 'package:flutter/material.dart';
import 'package:music_app/models/player.dart';
import 'package:music_app/screens/homepage_screen.dart';
import 'package:provider/provider.dart';
import 'package:audio_service/audio_service.dart';
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
      home: AudioServiceWidget(
              child: ChangeNotifierProvider(
          create: (_)=>Player(),
          child: HomePageScreen()),
      )
    );
  }
}
