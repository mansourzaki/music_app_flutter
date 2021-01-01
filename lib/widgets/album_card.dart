import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';

class AlbumCard extends StatefulWidget {
  final List<AlbumInfo> albumInfo;
  AlbumCard({@required this.albumInfo});

  @override
  _AlbumCardState createState() => _AlbumCardState();
}

class _AlbumCardState extends State<AlbumCard> with AutomaticKeepAliveClientMixin{
  ///int _counter ;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    print(widget.albumInfo.where((element) => element.title=="1989 (Deluxe)"));
    
    return GridView.builder(
      
        shrinkWrap: true,
        padding: EdgeInsets.only(left: 5, right: 5, top: 5),
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),

        //shrinkWrap: true,
        itemCount: widget.albumInfo.length,
        itemBuilder: (context, i) => Container(
              
              child: Card(
                color: Colors.black,
                elevation: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   
                      Expanded(
                        
                        child: widget.albumInfo[i].albumArt == null
                            ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                  Icons.person,
                                  size: 180,


                                ),
                            )
                            : Image(
                                width: double.infinity,
                                image:
                                    Image.file(File(widget.albumInfo[i].albumArt)).image,
                                fit: BoxFit.cover,
                              ),
                      ),
                    
                    
                    Padding(
                      padding: const EdgeInsets.only(left:5.0),
                      child: Text(
                        widget.albumInfo[i].title.startsWith("youtube")?"From Youtube":widget.albumInfo[i].title,
                        style: TextStyle(fontSize: 15, color: Colors.white),
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Text(
                          
                          widget.albumInfo[i].artist == "<unknown>"?"Unknown Artist":widget.albumInfo[i].artist,
                         
                          style: TextStyle(fontSize: 12, color: Colors.white54,),
                        
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.ellipsis,
                        ),
                    ),
                  ],
                ),
              ),
            ));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

// Row(

//                 children: [
//                   Column(
//                     children: [
//                       Text(
//                         albumInfo[i].title,
//                         style: TextStyle(fontSize: 15, color: Colors.white),

//                         //textAlign: TextAlign.start,
//                         //overflow: TextOverflow.fade,

//                       ),
//                       Text(
//                         albumInfo[i].artist,
//                         style: TextStyle(fontSize: 12, color: Colors.white),
//                       ),
//                     ],
//                   )
//                 ],
//               )),
//         ),
