import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:songapp/screens/songs_page.dart';
import 'login_page.dart';
import 'register_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent, // Colorful background
      body: Stack(
        children: [
          // Music Symbols Positioned at different places
          Positioned(
            top: 50,
            left: 30,
            child: Icon(
              Icons.music_note,
              size: 40,
              color: Colors.white.withOpacity(0.3),
            ),
          ),

          Positioned(
            top: 250,
            left: 100,
            child: Icon(
              Icons.music_note,
              size: 40,
              color: Colors.white.withOpacity(0.3),
            ),
          ),

          Positioned(
            top: 350,
            left: 100,
            child: Icon(
              Icons.music_note,
              size: 40,
              color: Colors.white.withOpacity(0.3),
            ),
          ),

          Positioned(
            top: 450,
            left: 300,
            child: Icon(
              Icons.music_note,
              size: 40,
              color: Colors.white.withOpacity(0.3),
            ),
          ),

          Positioned(
            top: 150,
            right: 50,
            child: Icon(
              Icons.music_note,
              size: 50,
              color: Colors.white.withOpacity(0.4),
            ),
          ),
          Positioned(
            bottom: 100,
            left: 80,
            child: Icon(
              Icons.music_note,
              size: 60,
              color: Colors.white.withOpacity(0.5),
            ),
          ),
          Positioned(
            bottom: 200,
            right: 100,
            child: Icon(
              Icons.music_note,
              size: 40,
              color: Colors.white.withOpacity(0.3),
            ),
          ),
          Positioned(
            top: 300,
            right: 10,
            child: Icon(
              Icons.music_note,
              size: 70,
              color: Colors.white.withOpacity(0.4),
            ),
          ),
          Positioned(
            top: 300,
            right: 100,
            child: Icon(
              Icons.music_note,
              size: 70,
              color: Colors.white.withOpacity(0.4),
            ),
          ),
          Positioned(
            top: 400,
            right: 200,
            child: Icon(
              Icons.music_note,
              size: 70,
              color: Colors.white.withOpacity(0.4),
            ),
          ),
          Positioned(
            top: 800,
            right: 300,
            child: Icon(
              Icons.music_note,
              size: 70,
              color: Colors.white.withOpacity(0.4),
            ),
          ),

          // Centered content with app name and buttons
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // App Name
                Text(
                  'StreekyMusics',
                  style: TextStyle(
                    fontSize: 128,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 50), // Space between text and buttons
                // Login Button
                FloatingActionButton.extended(
                  hoverColor: Color.fromARGB(255, 255, 247, 7),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  label: Text('Login'),
                  icon: Icon(Icons.login),
                  backgroundColor: Colors.orangeAccent,
                ),
                SizedBox(height: 20), // Space between buttons
                // Register Button
                FloatingActionButton.extended(
                  hoverColor: Color.fromARGB(255, 255, 0, 225),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterPage()),
                    );
                  },
                  label: Text('Register'),
                  icon: Icon(Icons.app_registration),
                  backgroundColor: Colors.pinkAccent,
                ),
                SizedBox(height: 20),
                // FloatingActionButton.extended(
                //   hoverColor: Color.fromARGB(255, 255, 0, 225),
                //   onPressed: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(builder: (context) => Songs()),
                //     );
                //   },
                //   label: Text('Songs'),
                //   icon: Icon(Icons.music_note_rounded),
                //   backgroundColor: Color.fromARGB(255, 180, 65, 12),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
