import 'package:flutter/material.dart';
import 'package:music_app/models/player.dart';
import 'package:provider/provider.dart';

class AudioPlayerBar extends StatelessWidget {
  // final player = AudioPlayer();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      height: 70,
      margin: EdgeInsets.symmetric(horizontal: 0, vertical: 3),
      padding: EdgeInsets.only(left: 15, bottom: 10, right: 10),
      child: Consumer<Player>(builder: (context, player, _) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              clipBehavior: Clip.antiAlias,
              borderRadius: BorderRadius.circular(0),
              child: Image(
                image: player.getSongPic ?? NetworkImage("https://image.flaticon.com/icons/png/512/26/26789.png"),
                //image:player.getSongPic ?? "https://cdn.onlinewebfonts.com/svg/img_497705.png",
               // "https://res.cloudinary.com/demo/image/fetch/https://upload.wikimedia.org/wikipedia/commons/1/13/Benedict_Cumberbatch_2011.png",
                fit: BoxFit.cover,
                width: 50,
                height: 50,
              ),
            ),
            Flexible(
              child: Container(
                padding: EdgeInsets.only(left: 5),
                margin: EdgeInsets.only(top: 8),
                child: Text(
                  player.getSongName,
                  style: TextStyle(
                    color: Colors.red[600],
                    fontSize: 16,
                  ),
                  overflow: TextOverflow.clip,
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            Row(
              children: [
                IconButton(
                    icon: Icon(
                      Icons.skip_next,
                      color: Colors.red[600],
                      size: 40,
                    ),
                    onPressed: () {}),
                IconButton(
                    icon: Icon(
                      player.iconSt,
                      color: Colors.red[600],
                      size: 40,
                    ),
                    onPressed: () {
                      player.status ? player.pause() : player.start();
                    }),
                IconButton(
                  icon: Icon(
                    Icons.skip_previous,
                    color: Colors.red[600],
                    size: 40,
                  ),
                  onPressed: () {},
                ),
              ],
            )
          ],
        );
      }),
    );
  }
}
