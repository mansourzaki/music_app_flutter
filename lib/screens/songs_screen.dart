import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:music_app/widgets/song_card.dart';

class SongsScreen extends StatelessWidget {
  final FlutterAudioQuery audioQuery = FlutterAudioQuery();
  
  
  @override
  Widget build(BuildContext context) {
      return FutureBuilder(
        future: audioQuery.getSongs(
            sortType: SongSortType.RECENT_YEAR),
        
        builder: (context, snapshot) {
         // print('in song screen');
          List<SongInfo> songsInfo = snapshot.data;
          if(snapshot.hasData) return SongCard(songsInfo: songsInfo);
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      );
    }
  }

