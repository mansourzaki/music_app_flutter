import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/player.dart';

class SongCard extends StatelessWidget {
  final String title;
  final ImageProvider albumArt;
  final String artistName;
  final String songPath;
  SongCard(
      {@required this.title,
      @required this.albumArt,
      @required this.artistName,
      @required this.songPath});

  @override
  Widget build(BuildContext context) {
    var player = Provider.of<Player>(context, listen: false);
    return ListTile(
      onTap: () {
        player.setSongName(title);
        player.setSongPic(albumArt);
        player.setPath(songPath);
        // if (player.status == true) {
        //   player.pause();
        // } else {
        player.start();
        // }

        //String f = await AudioManager.instance.file(File(widget.songsInfo[i].filePath), "dd");
        //AudioManager.instance.start("file://storage/emulated/0/Music/Taylor Swift - Fearless (International Edition)/01 Fearless.mp3","dd");
        //AudioManager.instance.start(widget.songsInfo[i].filePath, 'titl,,e');
      },
      leading: CircleAvatar(
          backgroundColor: Colors.red[400], backgroundImage: albumArt),
      title: Text(
        title,
        style: TextStyle(color: Colors.red[400]),
      ),
      subtitle: Text(
        artistName,
        style: TextStyle(color: Colors.white54),
      ),
    );
  }
}
