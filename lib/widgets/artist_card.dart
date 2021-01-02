
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';

class ArtistCard extends StatefulWidget {
  final List<ArtistInfo> artistInfo;
  ArtistCard({@required this.artistInfo});

  @override
  _ArtistCardState createState() => _ArtistCardState();
}

class _ArtistCardState extends State<ArtistCard> with AutomaticKeepAliveClientMixin{
  ArtistInfo artist;

  ///int _counter ;
  ///
  

  @override
  Widget build(BuildContext context) {
    super.build(context);
    // String path = ;
    //File file = File(path);

 //try {
      return ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, i) => ListTile(
          tileColor: Colors.black,
          leading: CircleAvatar(
              backgroundColor: Colors.red[400],
              child: widget.artistInfo[i].artistArtPath == null ? Icon(Icons.person,color: Colors.black45,) : null,
              backgroundImage: widget.artistInfo[i].artistArtPath == null
                  ? null
                  : Image.file(File(widget.artistInfo[i].artistArtPath)).image),
          title: Text(widget.artistInfo[i].name,style: TextStyle(color: Colors.red[400]),),
          
        ),
        
        itemCount: widget.artistInfo.length,
      );
   // } on NoSuchMethodError catch (_) {
    //  return Center(child: CircularProgressIndicator());
    //}
  }

  @override
  
  bool get wantKeepAlive => true;
}
