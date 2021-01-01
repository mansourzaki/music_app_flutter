import 'package:flutter/material.dart';
import 'package:music_app/screens/albums_screen.dart';
import 'package:music_app/screens/songs_screen.dart';
import 'package:music_app/screens/playlists_screen.dart';
import 'package:music_app/screens/artists_screen.dart';
import 'package:music_app/widgets/audioPlayerBar.dart';

class HomePageScreen extends StatefulWidget {
  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  int _selectedIndex = 0;
  PageController _pageController = PageController();
  final List<Widget> bottomBarItems = <Widget>[
    AlbumsScreen(
      key: PageStorageKey('album_screen'),
    ),
    ArtistsScreen(
      key: PageStorageKey('artist_screen'),
    ),
    SongsScreen(
      key: PageStorageKey('songs'),
    ),
    PlayListsScreen(
      key: PageStorageKey('playList'),
    ),
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  void _onItemTapped(int index) {
    _pageController.jumpToPage(index);
  }

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.15),
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
        body: PageView(
          controller: _pageController,
          children: bottomBarItems,
          onPageChanged: _onPageChanged,
        ),
        bottomNavigationBar: Container(
          color: Colors.black,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AudioPlayerBar(),
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
