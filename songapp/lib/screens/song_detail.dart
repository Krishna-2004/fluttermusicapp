import 'dart:math';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/song_model.dart';
// import 'package:flutter_pip/flutter_pip.dart';

// Global shuffle state using ValueNotifier
ValueNotifier<bool> shuffleNotifier = ValueNotifier(false); 

class SongDetail extends StatefulWidget {
  final Song song;
  final List<Song> songs;
  final int currentIndex;

  SongDetail({required this.song, required this.songs, required this.currentIndex});

  @override
  _SongDetailState createState() => _SongDetailState();
}

class _SongDetailState extends State<SongDetail> {
  late AudioPlayer _audioPlayer;
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;
  bool isPlaying = false;
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _loadFavoriteStatus();
    _initAudio();
  }

  Future<void> _initAudio() async {
    // Load song from assets
    await _audioPlayer.setAudioSource(AudioSource.asset(widget.song.filePath));
    _audioPlayer.durationStream.listen((duration) {
      setState(() {
        _duration = duration ?? Duration.zero;
      });
    });

    _audioPlayer.positionStream.listen((position) {
      setState(() {
        _position = position;
      });
    });
  }

  void playSong() {
    _audioPlayer.play();
    setState(() {
      isPlaying = true;
    });
  }

  void pauseSong() {
    _audioPlayer.pause();
    setState(() {
      isPlaying = false;
    });
  }

  Future<void> _loadFavoriteStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isFavorite = prefs.getBool(widget.song.title) ?? false;
    });
  }

  void toggleFavorite() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isFavorite = !isFavorite;
      prefs.setBool(widget.song.title, isFavorite);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(isFavorite ? 'Added to favorites' : 'Removed from favorites')),
    );
  }

  void nextSong() {
    if (shuffleNotifier.value) {
      // Pick a random song if shuffle mode is active
      int randomIndex = Random().nextInt(widget.songs.length);
      _switchSong(randomIndex);
    } else {
      // Play next song in order
      int nextIndex = (widget.currentIndex + 1) % widget.songs.length;
      _switchSong(nextIndex);
    }
  }

  void previousSong() {
    if (shuffleNotifier.value) {
      // Pick a random song if shuffle mode is active
      int randomIndex = Random().nextInt(widget.songs.length);
      _switchSong(randomIndex);
    } else {
      // Play previous song in order
      int prevIndex = (widget.currentIndex - 1 + widget.songs.length) % widget.songs.length;
      _switchSong(prevIndex);
    }
  }

  void _switchSong(int index) async {
    await _audioPlayer.stop(); // Stop current song
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => SongDetail(
          song: widget.songs[index],
          songs: widget.songs,
          currentIndex: index,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.song.title),
        actions: [
          // Use ValueListenableBuilder to watch shuffleNotifier
          ValueListenableBuilder(
            valueListenable: shuffleNotifier,
            builder: (context, bool isShuffle, child) {
              return IconButton(
                icon: Icon(isShuffle ? Icons.shuffle_on : Icons.shuffle),
                onPressed: () {
                  shuffleNotifier.value = !isShuffle; // Toggle shuffle state
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(shuffleNotifier.value ? 'Shuffle mode ON' : 'Shuffle mode OFF')),
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.song.title, style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            if (isPlaying) ...[
              Icon(Icons.music_note, size: 100),
              Text('Playing...', style: TextStyle(fontSize: 18)),
            ] else ...[
              Icon(Icons.music_off, size: 100),
              Text('Paused', style: TextStyle(fontSize: 18)),
            ],
            Slider(
              value: _position.inSeconds.toDouble(),
              max: _duration.inSeconds.toDouble(),
              onChanged: (value) {
                _audioPlayer.seek(Duration(seconds: value.toInt()));
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(Icons.skip_previous),
                  onPressed: previousSong,
                ),
                IconButton(
                  icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                  onPressed: isPlaying ? pauseSong : playSong,
                ),
                IconButton(
                  icon: Icon(Icons.skip_next),
                  onPressed: nextSong,
                ),
                IconButton(
                  icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
                  onPressed: toggleFavorite,
                ),
              ],
            ),
            Text("${_position.toString().split('.').first} / ${_duration.toString().split('.').first}")
          ],
        ),
      ),
    );
  }
}
