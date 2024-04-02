// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class NotificationController extends StateNotifier<bool> {
//   NotificationController() : super(true) {
//     loadNotificationPref();
//   }

//   static const _key = 'notification';

//   Future<void> loadNotificationPref() async {
//     final prefs = await SharedPreferences.getInstance();
//     final salahAlarms = prefs.getBool(_key) ?? true;
//     state = salahAlarms;
//   }

//   Future<void> saveNotificationPref(bool newValue) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setBool(_key, newValue);
//     state = newValue;
//   }
// }
// // -----------------------------------------------------------------------------

// final notificationProvider =
//     StateNotifierProvider<NotificationController, bool>((ref) {
//   return NotificationController();
// });
