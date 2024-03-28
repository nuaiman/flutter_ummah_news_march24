import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/quran.dart';

class QuranController extends StateNotifier<List<QuranSurah>> {
  QuranController() : super([]);

  static const String surahIdKey = 'surahId';
  static const String verseIdKey = 'verseId';

  Future<void> loadQuranSurahs(BuildContext context) async {
    String data = await DefaultAssetBundle.of(context)
        .loadString('assets/jsons/quran.json');
    List<dynamic> surahsJson = json.decode(data);
    state = surahsJson.map((json) => QuranSurah.fromJson(json)).toList();
  }

  QuranSurah? getSurahById(int id) {
    return state.firstWhere((surah) => surah.id == id);
  }

  Future<void> saveSurahVerseToSharedPreferences(
      int surahId, int verseId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(surahIdKey, surahId);
    await prefs.setInt(verseIdKey, verseId);
  }

  // Future<QuranSurah?> getSurahFromSharedPreferences() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   int? surahId = prefs.getInt(surahIdKey);
  //   if (surahId != null) {
  //     return getSurahById(surahId);
  //   }
  //   return null;
  // }

  Future<SavedSurahVerse?> getSurahFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? surahId = prefs.getInt(surahIdKey);
    int? verseId = prefs.getInt(verseIdKey);
    if (surahId != null && verseId != null) {
      QuranSurah? surah = getSurahById(surahId);
      if (surah != null) {
        return SavedSurahVerse(surah: surah, verseId: verseId);
      }
    }
    return null;
  }
}

final quranProvider =
    StateNotifierProvider<QuranController, List<QuranSurah>>((ref) {
  return QuranController();
});
