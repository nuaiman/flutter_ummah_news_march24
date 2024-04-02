import 'dart:convert';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imaan_barometer/models/salah.dart';
import 'package:imaan_barometer/models/salah_alarm.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SalahNotificationController extends StateNotifier<List<SalahAlarm>> {
  SalahNotificationController() : super([]) {
    loadSalahAlarms();
  }

  static const _key = 'salahAlarm';

  Future<void> loadSalahAlarms() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_key);
    if (jsonString != null) {
      final List<dynamic> jsonList = json.decode(jsonString);
      final Map<int, SalahAlarm> uniqueSalahAlarms = {};
      jsonList.forEach((item) {
        final SalahAlarm salahAlarm = SalahAlarm.fromMap(item);
        if (!uniqueSalahAlarms.containsKey(salahAlarm.id)) {
          uniqueSalahAlarms[salahAlarm.id] = salahAlarm;
        }
      });
      final List<SalahAlarm> loadedAlarms = uniqueSalahAlarms.values.toList();
      state = loadedAlarms;
    }
  }

  Future<void> _saveSalahAlarms(List<SalahAlarm> alarms) async {
    final prefs = await SharedPreferences.getInstance();
    final List<Map<String, dynamic>> jsonList =
        alarms.map((alarm) => alarm.toMap()).toList();
    prefs.setString(_key, json.encode(jsonList));
    state = List.from(state);
  }

  Future<void> addSalahAlarm(SalahAlarm salahAlarm, Salah salah) async {
    final List<SalahAlarm> existingAlarms = state;
    final existingIndex =
        existingAlarms.indexWhere((alarm) => alarm.id == salahAlarm.id);
    if (existingIndex != -1) {
      existingAlarms[existingIndex] = salahAlarm;
    } else {
      existingAlarms.add(salahAlarm);
    }
    await _saveSalahAlarms(existingAlarms);
    state = existingAlarms;
    await setAlarmForSalah(salah);
    state = List.from(state);
  }

  Future<void> removeSalahAlarm(int id, Salah salah) async {
    final List<SalahAlarm> existingAlarms = state;
    final existingIndex = existingAlarms.indexWhere((alarm) => alarm.id == id);
    if (existingIndex != -1) {
      existingAlarms.removeAt(existingIndex);
      await _saveSalahAlarms(existingAlarms);
      state = existingAlarms;
      await AwesomeNotifications().cancel(salah.id);
      state = List.from(state);
    }
  }

  Future<void> removeAllSalahAlarms() async {
    await AwesomeNotifications().cancelAll();
    state = [];
    _saveSalahAlarms(state);
  }

  // Future<void> updateSalahAzanStatus(int id, bool isAzan, Salah salah) async {
  //   final List<SalahAlarm> existingAlarms = state;
  //   final existingIndex = existingAlarms.indexWhere((alarm) => alarm.id == id);
  //   if (existingIndex != -1) {
  //     final SalahAlarm updatedAlarm =
  //         existingAlarms[existingIndex].copyWith(isAzan: isAzan);
  //     existingAlarms[existingIndex] = updatedAlarm;
  //     await _saveSalahAlarms(existingAlarms);
  //     state = existingAlarms;
  //     await setAlarmForSalah(salah);
  //     state = List.from(state);
  //   }
  // }

  Future<void> toggleSalahAzanStatus(int id, Salah salah) async {
    final List<SalahAlarm> existingAlarms = state;
    final existingIndex = existingAlarms.indexWhere((alarm) => alarm.id == id);
    if (existingIndex != -1) {
      final updatedAlarm = existingAlarms[existingIndex].copyWith(
        isAzan: !existingAlarms[existingIndex].isAzan, // Toggle isAzan value
      );
      existingAlarms[existingIndex] = updatedAlarm;
      await _saveSalahAlarms(existingAlarms);
      state = existingAlarms;
      await setAlarmForSalah(salah);
      state = List.from(state);
    }
  }

  SalahAlarm? getSalahAlarmById(int id) {
    final itemIndex = state.indexWhere((element) => element.id == id);
    if (itemIndex == -1) {
      return null;
    }
    return state.firstWhere(
      (alarm) => alarm.id == id,
    );
  }

  // SalahAlarm alarm, Salah salah

  Future<void> initializeAlarms(List<Salah> salahList) async {
    for (final salah in salahList) {
      final itemIndex = state.indexWhere((element) => element.id == salah.id);
      if (itemIndex == -1) {
        continue;
      }
      await setAlarmForSalah(salah);
    }
  }

  Future<void> setAlarmForSalah(Salah salah) async {
    // await AwesomeNotifications().cancelAll();
    SalahAlarm? salahAlarm = getSalahAlarmById(salah.id);
    await AwesomeNotifications().cancel(salah.id);
    final notificationId = salah.id;
    final scheduledTime =
        salah.time.subtract(const Duration(minutes: 13, hours: 1));
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: notificationId,
        channelKey: notificationId.toString(),
        title: 'Prayer Reminder',
        body: 'It\'s time for ${salah.nameEn} prayer.',
        wakeUpScreen: true,
        category: NotificationCategory.Alarm,
        actionType: ActionType.Default,
        // customSound: salahAlarm!.isAzan ? Sounds.azan : Sounds.alert,
        // customSound: 'assets/sounds/alert.mp3',
        autoDismissible: true,
      ),
      actionButtons: [
        NotificationActionButton(
          key: 'CANCEL',
          label: 'stop',
          actionType: ActionType.Default,
        ),
      ],
      schedule: NotificationCalendar(
        preciseAlarm: true,
        repeats: true,
        hour: scheduledTime.hour,
        minute: scheduledTime.minute,
        allowWhileIdle: true,
      ),
    );
  }
}
// -----------------------------------------------------------------------------

final salahNotificationProvider =
    StateNotifierProvider<SalahNotificationController, List<SalahAlarm>>((ref) {
  return SalahNotificationController();
});
