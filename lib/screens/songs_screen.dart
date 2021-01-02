import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:music_app/widgets/song_card.dart';

class SongsScreen extends StatefulWidget {
  SongsScreen({Key key}) : super(key: key);

  @override
  _SongsScreenState createState() => _SongsScreenState();
}

class _SongsScreenState extends State<SongsScreen>
    with AutomaticKeepAliveClientMixin {
  final FlutterAudioQuery audioQuery = FlutterAudioQuery();
  Future<Uint8List> getMyImage(String id) async{
    final artPic = await audioQuery.getArtwork(type: ResourceType.SONG, id: id);
    pic = artPic;
    print("Insidr Metjod  ");
    return artPic;
  }

  Uint8List pic;
  // List<SongInfo> allSongs = [];
  // Future<void> getSongs() async {
  //   List<SongInfo> list =
  //   await audioQuery.getSongs(sortType: SongSortType.RECENT_YEAR);
  //   allSongs = list;

  // }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return FutureBuilder(
      future: audioQuery.getSongs(sortType: SongSortType.RECENT_YEAR),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          snapshot.data.removeWhere(
              (element) => RegExp("[0-9][0-9][0-9]\$").hasMatch(element.title));
        }
        if (!snapshot.hasData)
          return Center(
            child: Text(
              "Getting your songs...",
              style: TextStyle(color: Colors.orange),
            ),
          );
        return ListView.builder(
          itemCount: snapshot.data.length,
          itemBuilder: (context, i) {
            getMyImage(snapshot.data[i].id);
            return SongCard(
            title: snapshot.data[i].title,
            artistName: snapshot.data[i].artist,
            songPath: snapshot.data[i].filePath,
            albumArt: MemoryImage(pic)
                ?? NetworkImage(
                    "https://icons.iconarchive.com/icons/graphicloads/android-settings/512/songs-icon.png",
                  )
                
          );}
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
