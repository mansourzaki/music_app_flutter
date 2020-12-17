import 'package:flutter/material.dart';
import 'package:music_app/screens/albums_screen.dart';
import 'package:music_app/screens/songs_screen.dart';
import 'package:music_app/screens/playlists_screen.dart';
import 'package:music_app/screens/artists_screen.dart';

class HomePageScreen extends StatefulWidget {
  
  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  int _selectedIndex = 0;

  static List<Widget> bottomBarItems = <Widget>[
    AlbumsScreen(),
    ArtistsScreen(),
    SongsScreen(),
    PlayListsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF1a1a18),
        appBar: AppBar(
          title: _selectedIndex == 0
              ? Text("My Albums")
              : _selectedIndex == 1
                  ? Text('Artists')
                  : _selectedIndex == 2
                      ? Text('Songs')
                      : Text('My PlayLists'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
            )
          ],
        ),
        body: bottomBarItems[_selectedIndex],
        bottomNavigationBar: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                color: Colors.black,
                height: 70,
                margin: EdgeInsets.symmetric(horizontal: 0,vertical: 3),
                padding: EdgeInsets.only(left: 15,bottom: 10,right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      clipBehavior: Clip.antiAlias,
                      borderRadius: BorderRadius.circular(0),
                      child: Image.network(
                        "https://res.cloudinary.com/demo/image/fetch/https://upload.wikimedia.org/wikipedia/commons/1/13/Benedict_Cumberbatch_2011.png",
                        fit: BoxFit.cover,
                        width: 50,
                        height: 50,
                      ),
                    ),
                    Text("song titleee",style: TextStyle(color: Colors.red[600],fontSize: 20),overflow: TextOverflow.ellipsis),
                    Row(
                      children: [
                        IconButton(
                            icon: Icon(Icons.skip_next, color: Colors.red[600],size: 40,),
                            onPressed: null),
                        IconButton(
                            icon:
                                Icon(Icons.play_arrow, color: Colors.red[600],size: 40,),
                            onPressed: null),
                        IconButton(
                            icon: Icon(Icons.skip_previous,
                                color: Colors.red[600],size: 40,),
                            onPressed: null),
                      ],
                    )
                  ],
                ),
              ),
              // Divider(
              //   height: 5,
              // ),
              BottomNavigationBar(
                onTap: _onItemTapped,
                currentIndex: _selectedIndex,
                showUnselectedLabels: true,
                unselectedLabelStyle: TextStyle(color: Colors.red[600]),
                unselectedItemColor: Colors.red[600],
                selectedItemColor: Colors.white,
                items: [
                  BottomNavigationBarItem(
                    backgroundColor: Colors.black,
                    icon: Icon(Icons.library_music),
                    label: 'Albums',
                  ),
                  BottomNavigationBarItem(
                    backgroundColor: Colors.black,
                    icon: Icon(Icons.person),
                    label: 'Artists',
                  ),
                  BottomNavigationBarItem(
                    backgroundColor: Colors.black,
                    icon: Icon(Icons.music_note),
                    label: 'Songs',
                  ),
                  BottomNavigationBarItem(
                    backgroundColor: Colors.black,
                    icon: Icon(Icons.playlist_play),
                    label: 'PlayLists',
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
