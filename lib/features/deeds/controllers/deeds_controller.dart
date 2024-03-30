import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../models/deed.dart';
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

  // List<Deed> getLast7DaysDeeds() {
  //   final today = DateTime.now();
  //   final last7Days =
  //       List.generate(7, (index) => today.subtract(Duration(days: index)));
  //   return state.where((deed) {
  //     final deedDate = DateTime(deed.year, deed.month, deed.day);
  //     return last7Days.any((date) =>
  //         date.year == deedDate.year &&
  //         date.month == deedDate.month &&
  //         date.day == deedDate.day);
  //   }).toList();
  // }

  Map<String, List<Deed>> getLast7DaysDeeds() {
    final today = DateTime.now();
    final last7Days =
        List.generate(7, (index) => today.subtract(Duration(days: index)));

    // Initialize the result map
    Map<String, List<Deed>> result = {};

    // Iterate through last 7 days
    for (int i = 0; i < last7Days.length; i++) {
      // Get the date string in the format you desire (e.g., "Today", "1DayAgo", etc.)
      String dayKey;
      if (i == 0) {
        dayKey = "Today";
      } else if (i == 1) {
        dayKey = "1DayAgo";
      } else {
        dayKey = "${i}DaysAgo";
      }

      // Filter deeds for the current day
      List<Deed> deedsForDay = state.where((deed) {
        return deed.year == last7Days[i].year &&
            deed.month == last7Days[i].month &&
            deed.day == last7Days[i].day;
      }).toList();

      // Add the list of deeds to the result map
      result[dayKey] = deedsForDay;
    }

    return result;
  }
}

final deedsProvider = StateNotifierProvider<DeedsController, List<Deed>>((ref) {
  return DeedsController();
});
