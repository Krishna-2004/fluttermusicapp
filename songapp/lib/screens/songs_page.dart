import 'package:flutter/material.dart';
import 'song_detail.dart';
import '../models/song_model.dart';

class Songs extends StatelessWidget {
  final List<Song> songs = [
    Song('Aval', 'assets/songs/song1.mp3'),
    Song('Munbe Vaa', 'assets/songs/song2.mp3'),
    Song('Sirukki Vaasam', 'assets/songs/song3.mp3'),
    Song('Adiye Sakkarakatti', 'assets/songs/song4.mp3'),
    Song('Ennadi Maayaavi', 'assets/songs/song5.mp3'),
    Song('Vinmeen Vithaiyil', 'assets/songs/song6.mp3'),
    Song('Hey Suzhali', 'assets/songs/song7.mp3'),
    Song('Yaanji', 'assets/songs/song8.mp3'),
    Song('Otha Sollaala', 'assets/songs/song9.mp3'),
    Song('Thalli Pogathey', 'assets/songs/song10.mp3'),
    Song('Kadhaipomaa', 'assets/songs/song11.mp3'),
    // Add more songs as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Songs List'),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              // Navigate to favorite songs page (not implemented)
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Favorite songs button pressed')),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              // Implement logout functionality
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: songs.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(songs[index].title),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SongDetail(song: songs[index], songs: songs, currentIndex: index,),
                ),
              );
            },
          );
        },
      ),
    );
  }
}


