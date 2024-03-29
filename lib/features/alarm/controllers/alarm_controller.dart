// import 'package:alarm/alarm.dart';
// import 'package:alarm/model/alarm_settings.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:imaan_barometer/models/salah.dart';
// import 'package:imaan_barometer/models/salah_alarm.dart';

// class AlarmController extends StateNotifier<List<SalahAlarm>> {
//   AlarmController() : super([]);

//   void setAlarmFor(SalahAlarm alarm, Salah salah) async {
//     final newAlarm = alarm;
//     // if state already has id, remove and return
//     state = [...state, alarm];
//     // ---------------------------------------------------------
//     // make the below recuring and remove a particular weekDay afte playing once
//     final alarmSettings = AlarmSettings(
//       id: salah.nameEn == 'Fazr'
//           ? 1
//           : salah.nameEn == 'Sunrise'
//               ? 2
//               : salah.nameEn == 'Dhuhr'
//                   ? 3
//                   : salah.nameEn == 'Asr'
//                       ? 4
//                       : salah.nameEn == 'Magrib'
//                           ? 5
//                           : salah.nameEn == 'Isha'
//                               ? 6
//                               : 0,
//       dateTime: salah.time,
//       assetAudioPath: 'assets/alarm.mp3',
//       loopAudio: true,
//       vibrate: true,
//       volume: 1,
//       fadeDuration: 0,
//       notificationTitle: salah.nameEn,
//       notificationBody: salah.nameBn,
//       enableNotificationOnKill: true,
//     );

//     await Alarm.set(alarmSettings: alarmSettings);
//   }
// }
// // -----------------------------------------------------------------------------

// final alarmProvider =
//     StateNotifierProvider<AlarmController, List<SalahAlarm>>((ref) {
//   return AlarmController();
// });
