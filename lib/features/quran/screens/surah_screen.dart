import 'package:flutter/material.dart';
import 'package:imaan_barometer/models/quran.dart';

class SurahScreen extends StatelessWidget {
  final QuranSurah surah;

  static route({required QuranSurah surah}) => MaterialPageRoute(
        builder: (context) => SurahScreen(
          surah: surah,
        ),
      );

  const SurahScreen({super.key, required this.surah});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child:
            Text(surah.name), // Example of accessing a property of QuranSurah
      ),
    );
  }
}
