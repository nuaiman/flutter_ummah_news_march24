import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imaan_barometer/models/deed.dart';

// class DeedStateNotifier extends StateNotifier<List<Deed>> {
//   DeedStateNotifier()
//       : super([
//           Deed(
//             id: 1,
//             title: 'Title 1',
//             isDone: false,
//             dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
//             day: DateTime.now().day,
//             month: DateTime.now().month,
//             year: DateTime.now().year,
//           ),
//           Deed(
//             id: 2,
//             title: 'Title 2',
//             isDone: false,
//             dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
//             day: DateTime.now().day,
//             month: DateTime.now().month,
//             year: DateTime.now().year,
//           ),
//           Deed(
//             id: 3,
//             title: 'Title 3',
//             isDone: false,
//             dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
//             day: DateTime.now().day,
//             month: DateTime.now().month,
//             year: DateTime.now().year,
//           ),
//           Deed(
//             id: 4,
//             title: 'Title 4',
//             isDone: false,
//             dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
//             day: DateTime.now().day,
//             month: DateTime.now().month,
//             year: DateTime.now().year,
//           ),
//           Deed(
//             id: 5,
//             title: 'Title 5',
//             isDone: false,
//             dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
//             day: DateTime.now().day,
//             month: DateTime.now().month,
//             year: DateTime.now().year,
//           ),
//           Deed(
//             id: 6,
//             title: 'Title 6',
//             isDone: false,
//             dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
//             day: DateTime.now().day,
//             month: DateTime.now().month,
//             year: DateTime.now().year,
//           ),
//           Deed(
//             id: 7,
//             title: 'Title 7',
//             isDone: false,
//             dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
//             day: DateTime.now().day,
//             month: DateTime.now().month,
//             year: DateTime.now().year,
//           ),
//         ]);

//   bool getIsDoneStatus(int id) {
//     return state.firstWhere((element) => element.id == id).isDone;
//   }

//   void markAsDone(int id, bool value) {
//     final updatedState = [...state];
//     updatedState.firstWhere((deed) => deed.id == id).isDone = value;
//     state = updatedState;
//   }
// }

class DeedsController extends StateNotifier<List<Deed>> {
  DeedsController() : super([]);

  static const _key = 'deeds';

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

  void markAsDone(Deed deed, bool value) {
    final updateAbleDeed = deed.copyWith(isDone: value);
    if (value == true) {
      final alreadyExists = state.any((existingDeed) =>
          existingDeed.id == deed.id &&
          existingDeed.dayOfWeek == deed.dayOfWeek &&
          existingDeed.day == deed.day &&
          existingDeed.month == deed.month &&
          existingDeed.year == deed.year);

      if (!alreadyExists) {
        state = [...state, updateAbleDeed];
      }
    } else {
      state.removeWhere(
        (existingDeed) =>
            existingDeed.id == deed.id &&
            existingDeed.dayOfWeek == deed.dayOfWeek &&
            existingDeed.day == deed.day &&
            existingDeed.month == deed.month &&
            existingDeed.year == deed.year,
      );
      state = List.from(state);
    }
    print(state);
  }

  // Future<void> _saveDeeds(List<Deed> deeds) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final deedsJson = deeds.map((deed) => jsonEncode(deed.toJson())).toList();
  //   await prefs.setStringList(_key, deedsJson);
  // }

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
