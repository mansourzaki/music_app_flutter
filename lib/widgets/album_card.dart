import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';

class AlbumCard extends StatelessWidget {
  final List<AlbumInfo> albumInfo;
  AlbumCard({@required this.albumInfo});

  ///int _counter ;
  @override
  Widget build(BuildContext context) {
    
    print(albumInfo.where((element) => element.title=="1989 (Deluxe)"));
    
    return GridView.builder(
      
        shrinkWrap: true,
        padding: EdgeInsets.only(left: 5, right: 5, top: 5),
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),

        //shrinkWrap: true,
        itemCount: albumInfo.length,
        itemBuilder: (context, i) => Container(
              
              child: Card(
                color: Colors.black,
                elevation: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   
                      Expanded(
                        
                        child: albumInfo[i].albumArt == null
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
                                    Image.file(File(albumInfo[i].albumArt)).image,
                                fit: BoxFit.cover,
                              ),
                      ),
                    
                    
                    Padding(
                      padding: const EdgeInsets.only(left:5.0),
                      child: Text(
                        albumInfo[i].title.startsWith("youtube")?"From Youtube":albumInfo[i].title,
                        style: TextStyle(fontSize: 15, color: Colors.white),
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Text(
                          
                          albumInfo[i].artist == "<unknown>"?"Unknown Artist":albumInfo[i].artist,
                         
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
