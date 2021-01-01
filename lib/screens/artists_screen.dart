import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:music_app/widgets/artist_card.dart';


  

 class ArtistsScreen extends StatelessWidget {
  final FlutterAudioQuery audioQuery = FlutterAudioQuery();
  ArtistsScreen({Key key}) : super(key: key);
  //List<ArtistInfo> allArtistsInfo = [];
  // Future getAllArtists () async{
  //   List<ArtistInfo> artists = await audioQuery.getArtists();
  //   artists.forEach((artist) {
  //    allArtistsInfo.addAll(artists);
  //   });

  // }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: audioQuery.getArtists(
            sortType: ArtistSortType.MORE_TRACKS_NUMBER_FIRST),
        builder: (context, snapshot) {
          List<ArtistInfo> artistsInfo = snapshot.data;
          if(snapshot.hasData) return ArtistCard(artistInfo: artistsInfo);
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      );
    
  }
}
