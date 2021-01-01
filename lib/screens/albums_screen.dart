import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:music_app/widgets/album_card.dart';

class AlbumsScreen extends StatelessWidget {

  final FlutterAudioQuery audioQuery = FlutterAudioQuery();
  AlbumsScreen({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: audioQuery.getAlbums(
            sortType: AlbumSortType.MOST_RECENT_YEAR),
        builder: (context, snapshot) {
          List<AlbumInfo> albumsInfo = snapshot.data;
          if(snapshot.hasData) return AlbumCard(albumInfo: albumsInfo);
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      );
  }
}