import 'package:just_audio/just_audio.dart';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:provider/provider.dart';
import '../models/player.dart';


class SongCard extends StatefulWidget {
  final List<SongInfo> songsInfo;
  final Uint8List albumArtIfNull;
  
  SongCard({@required this.songsInfo, this.albumArtIfNull});

  @override
  _SongCardState createState() => _SongCardState();
}

class _SongCardState extends State<SongCard> with AutomaticKeepAliveClientMixin{
  SongInfo song;
  //final player = AudioPlayer(); 
  final FlutterAudioQuery audioQuery = FlutterAudioQuery();
  
  Future<Uint8List> songArtWork(String id) async {
    return await audioQuery.getArtwork(type: ResourceType.SONG, id: id);
  }

  @override
  Widget build(BuildContext context) {
    var player = Provider.of<Player>(context);
    super.build(context);
    widget.songsInfo.removeWhere(
        (element) => RegExp("[0-9][0-9][0-9]\$").hasMatch(element.title));
    // print(songsInfo.where((element) => element.title == 'Fearless'));
    // Future<Uint8List> getArtWork(String id){
    //   return audioQuery.getArtwork(type: ResourceType.SONG, id: id);
    // }
    return ListView.builder(
      itemBuilder: (context, i) => FutureBuilder<Uint8List>(
          future: audioQuery.getArtwork(
              type: ResourceType.SONG, id: widget.songsInfo[i].id),
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListTile(
              
              onTap: () async {
                player.setSongName(widget.songsInfo[i].title);
                player.setSongPic(Image.memory(snapshot.data).image);
                player.setPath(widget.songsInfo[i].filePath);
                if(player.status == true){
                  player.pause();
                  
                }else{
                  player.start();
                  
                }
            
              
                //String f = await AudioManager.instance.file(File(widget.songsInfo[i].filePath), "dd");
                //AudioManager.instance.start("file://storage/emulated/0/Music/Taylor Swift - Fearless (International Edition)/01 Fearless.mp3","dd");
                //AudioManager.instance.start(widget.songsInfo[i].filePath, 'titl,,e');
              },
              leading: CircleAvatar(
                  backgroundColor: Colors.red[400],
                  backgroundImage: Image.memory(snapshot.data).image),
              title: Text(
                widget.songsInfo[i].title,
                style: TextStyle(color: Colors.red[400]),
              ),
              subtitle: Text(
                widget.songsInfo[i].artist,
                style: TextStyle(color: Colors.white54),
              ),
              
            );
          }),

      itemCount: widget.songsInfo.length,
    );
    
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

// ListTile(
//         tileColor: Colors.black,
//         leading: CircleAvatar(
//             backgroundColor: Colors.red[400],
//             child: songsInfo[i].albumArtwork == null
//                 ? Icon(
//                     Icons.person,
//                     color: Colors.black45,
//                   )
//                 : null,
//             backgroundImage: songsInfo[i].albumArtwork == null
//                 ? null
//                 : Image.file(File(songsInfo[i].albumArtwork)).image),
//         title: Text(
//           songsInfo[i].title,
//           style: TextStyle(color: Colors.red[400]),
//         ),
//         subtitle: Text(songsInfo[i].artist,style: TextStyle(color: Colors.white54),),
//       ),
//       itemCount: songsInfo.length,
//     );
// FutureBuilder<Uint8List>(
//         future: audioQuery.getArtwork(
//             type: ResourceType.SONG, id: widget.songsInfo[_count].id),
//         builder: (context, snapshot) {
//           print('in card screen');

//           if (snapshot.data == null) {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
