

import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:music_app/widgets/song_card.dart';


class SongsScreen extends StatefulWidget {

  SongsScreen({Key key}) : super(key: key);

  @override
  _SongsScreenState createState() => _SongsScreenState();
}

class _SongsScreenState extends State<SongsScreen>{
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
         
          );
        },
      );
    }

  
  
}

