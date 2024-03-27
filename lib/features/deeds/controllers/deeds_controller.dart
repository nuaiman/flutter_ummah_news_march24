import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imaan_barometer/models/deed.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DeedsController extends StateNotifier<List<Deed>> {
  DeedsController() : super([]);

  static const _key = 'deeds';

  Future<void> loadDeeds() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? deedsJson = prefs.getStringList(_key);

    if (deedsJson != null) {
      final deeds =
          deedsJson.map((json) => Deed.fromJson(jsonDecode(json))).toList();
      state = deeds;
    } else {
      state = [];
    }

    print(state);
  }

  Future<void> _saveDeeds(List<Deed> deeds) async {
    final prefs = await SharedPreferences.getInstance();
    final deedsJson = deeds.map((deed) => jsonEncode(deed.toJson())).toList();
    await prefs.setStringList(_key, deedsJson);
  }

  void markAsDone(Deed deed, bool value) {
    final updateAbleDeed = deed.copyWith(isDone: value);
    bool isSameDeed(Deed existingDeed) {
      return existingDeed.id == deed.id &&
          existingDeed.dayOfWeek == deed.dayOfWeek &&
          existingDeed.day == deed.day &&
          existingDeed.month == deed.month &&
          existingDeed.year == deed.year;
    }

    if (value == true) {
      final alreadyExists = state.any(isSameDeed);
      if (!alreadyExists) {
        state = [...state, updateAbleDeed];
      }
    } else {
      state.removeWhere(isSameDeed);
      state = List.from(state);
    }
    print(state);
    _saveDeeds(state);
  }

  bool getIsDoneStatus(Deed deed) {
    try {
      return state
          .firstWhere((element) =>
              element.id == deed.id &&
              element.dayOfWeek == deed.dayOfWeek &&
              element.day == deed.day &&
              element.month == deed.month &&
              element.year == deed.year)
          .isDone;
    } catch (e) {
      return false;
    }
  }

  // Future<List<Deed>> _getDeeds() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final deedsJson = prefs.getStringList(_key) ?? [];
  //   return deedsJson.map((json) => Deed.fromJson(jsonDecode(json))).toList();
  // }

  // Future<void> loadData() async {
  //   final List<Deed> existingDeeds = state;
  //   final List<Deed> loadedDeeds = await _getDeeds();
  //   print(loadedDeeds);
  //   for (final loadedDeed in loadedDeeds) {
  //     final matchingDeedIndex = existingDeeds.indexWhere((existingDeed) =>
  //         existingDeed.dayOfWeek == loadedDeed.dayOfWeek &&
  //         existingDeed.day == loadedDeed.day &&
  //         existingDeed.month == loadedDeed.month &&
  //         existingDeed.year == loadedDeed.year);

  //     if (matchingDeedIndex != -1) {
  //       existingDeeds[matchingDeedIndex] = existingDeeds[matchingDeedIndex]
  //           .copyWith(isDone: loadedDeed.isDone);
  //     }
  //   }
  //   state = existingDeeds;
  // }

  // Future<void> addDeed(Deed deed) async {
  //   final List<Deed> deeds = List.from(state);
  //   deeds.add(deed);
  //   state = deeds;
  //   await _saveDeeds(state);
  // }

  // Future<void> removeDeed(Deed deed) async {
  //   final List<Deed> deeds = List.from(state);
  //   deeds.removeWhere((item) => item.id == deed.id);
  //   state = deeds;
  //   await _saveDeeds(state);
  // }
}

final deedsProvider = StateNotifierProvider<DeedsController, List<Deed>>((ref) {
  return DeedsController();
});
