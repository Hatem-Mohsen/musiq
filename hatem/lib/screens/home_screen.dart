import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class HomeScreen extends StatelessWidget {
  final AudioPlayer audioPlayer = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0B0014),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40), // to adjust for the status bar height
            TextField(
              decoration: InputDecoration(
                hintText: 'search song',
                prefixIcon: Icon(Icons.search, color: Colors.white70),
                filled: true,
                fillColor: Color(0xFF1C1C1E),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 15),
              ),
              style: TextStyle(color: Colors.white70),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'RECENTLY PLAYED',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'See All',
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
            SizedBox(height: 10),
            Container(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildRecentlyPlayedItem('assets/images/1.png', 'Antretor', 'yann tiersen', 'assets/audio/سورة الفلق محمود خليل الحصري mp3.mp3'),
                  _buildRecentlyPlayedItem('assets/images/1.png', 'Back To Her Men', 'Demien Rice', 'assets/audio/سورة الفلق محمود خليل الحصري mp3.mp3'),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'RECOMMENDATION',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'See All',
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  _buildRecommendationItem('assets/audio/سورة الفلق محمود خليل الحصري mp3.mp3', 'Back To Her Men', 'Demien Rice', 'assets/audio/سورة الفلق محمود خليل الحصري mp3.mp3'),
                  _buildRecommendationItem('assets/audio/سورة الفلق محمود خليل الحصري mp3.mp3', 'Hotline Bling', 'Billie Eilish', 'assets/audio/سورة الفلق محمود خليل الحصري mp3.mp3'),
                  _buildRecommendationItem('assets/audio/سورة الفلق محمود خليل الحصري mp3.mp3', 'Antretor', 'yann tiersen', 'assets/audio/سورة الفلق محمود خليل الحصري mp3.mp3'),
                  _buildRecommendationItem('assets/audio/سورة الفلق محمود خليل الحصري mp3.mp3', 'Nightmare', 'Halsey', 'assets/audio/سورة الفلق محمود خليل الحصري mp3.mp3'),
                  _buildRecommendationItem('assets/audio/سورة الفلق محمود خليل الحصري mp3.mp3', 'Get You The Moon', 'Kina', 'assets/audio/سورة الفلق محمود خليل الحصري mp3.mp3'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentlyPlayedItem(String imagePath, String title, String artist, String audioPath) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Column(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          SizedBox(height: 5),
          Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
          Text(
            artist,
            style: TextStyle(color: Colors.white70, fontSize: 12),
          ),
          IconButton(
            icon: Icon(Icons.play_circle_fill, color: Colors.white),
            onPressed: () {
              audioPlayer.play(AssetSource(audioPath));
            },
          ),
        ],
      ),
    );
  }

  Widget _buildRecommendationItem(String imagePath, String title, String artist, String audioPath) {
    return ListTile(
      leading: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
      subtitle: Text(
        artist,
        style: TextStyle(color: Colors.white70),
      ),
      trailing: IconButton(
        icon: Icon(Icons.play_circle_fill, color: Colors.white70),
        onPressed: () {
          audioPlayer.play(AssetSource(audioPath));
        },
      ),
    );
  }
}
