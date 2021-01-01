import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
//import 'package:provider/provider.dart';

enum ViewState { playing, paused }

class Player extends BackgroundAudioTask with ChangeNotifier {
  AudioPlayer player = AudioPlayer();
  var iconSt = Icons.play_arrow;
   String songName = "";
   ImageProvider songPic;
  AudioPlayer get getPlayer {
    return player;
  }

  ViewState get getStatus {
    if (player.playerState.playing) return ViewState.playing;

    return ViewState.paused;
  }

  void setPath(String path) {
    player.setFilePath(path);
  }

  void start() {
    player.play();
    iconSt = Icons.pause;
    notifyListeners();
  }

  void pause() {
    player.pause();
    iconSt = Icons.play_arrow;
    notifyListeners();
  }

  

  bool get status{
    if (player.playerState.playing)
    return true;
    else
    return false;
  }

  void setSongName(String name){
    songName = name;
    notifyListeners();
  }

  String get getSongName{
    return songName;
    
  }

  void setSongPic(ImageProvider pic){
    songPic = pic;
    notifyListeners();
  }

  ImageProvider get getSongPic{
    return songPic;
    
  }
}
