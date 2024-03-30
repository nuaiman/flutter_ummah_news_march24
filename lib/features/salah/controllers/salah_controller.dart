import 'dart:async';

import 'package:adhan/adhan.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../gps/controllers/gps_controller.dart';
import '../../../models/salah.dart';

import '../../../models/gps.dart';

class SalahController extends StateNotifier<List<Salah>> {
  final GpsModel _gpsController;
  SalahController({required GpsModel gpsController})
      : _gpsController = gpsController,
        super([]);

  // Future<void> getPrayerTimes() async {
  //   final myCoordinates =
  //       Coordinates(_gpsController.latitude, _gpsController.longitude);
  //   final params = CalculationMethod.karachi.getParameters();
  //   params.madhab = Madhab.hanafi;
  //   final prayerTimes = PrayerTimes.today(myCoordinates, params);
  //   final salahList = [
  //     Salah(nameEn: 'Fazr', nameBn: 'ফজর', time: prayerTimes.fajr),
  //     Salah(nameEn: 'Sunrise', nameBn: 'সূর্যোদয়', time: prayerTimes.sunrise),
  //     Salah(nameEn: 'Dhuhr', nameBn: 'জোহর', time: prayerTimes.dhuhr),
  //     Salah(nameEn: 'Asr', nameBn: 'আসর', time: prayerTimes.asr),
  //     Salah(nameEn: 'Magrib', nameBn: 'মাগরিব', time: prayerTimes.maghrib),
  //     Salah(nameEn: 'Isha', nameBn: 'ইশা', time: prayerTimes.isha),
  //   ];
  //   Future.delayed(const Duration(microseconds: 10), () {
  //     state = salahList;
  //   });
  // }

  Future<void> getPrayerTimes() async {
    final myCoordinates =
        Coordinates(_gpsController.latitude, _gpsController.longitude);
    final params = CalculationMethod.karachi.getParameters();
    params.madhab = Madhab.hanafi;
    final prayerTimes = PrayerTimes.today(myCoordinates, params);

    // Create notification content for each prayer time
    final salahList = [
      Salah(
        id: 0,
        nameEn: 'Sunrise',
        nameBn: 'সূর্যোদয়',
        time: prayerTimes.sunrise,
      ),
      Salah(
        id: 1,
        nameEn: 'Fazr',
        nameBn: 'ফজর',
        time: prayerTimes.fajr,
      ),
      Salah(
        id: 2,
        nameEn: 'Dhuhr',
        nameBn: 'জোহর',
        time: prayerTimes.dhuhr,
      ),
      Salah(
        id: 3,
        nameEn: 'Asr',
        nameBn: 'আসর',
        time: prayerTimes.asr,
      ),
      Salah(
        id: 4,
        nameEn: 'Magrib',
        nameBn: 'মাগরিব',
        time: prayerTimes.maghrib,
      ),
      Salah(
        id: 5,
        nameEn: 'Isha',
        nameBn: 'ইশা',
        time: prayerTimes.isha,
      ),
    ];
    Future.delayed(Duration(microseconds: 10), () {
      state = salahList;
    });
    // Cancel existing notifications for past salah times
    // salahList.forEach((salah) async {
    //   final notificationId = salah.id;

    // });
    await AwesomeNotifications().cancelAll();
    // Schedule recurring notifications for each prayer time
    salahList.forEach((salah) async {
      final notificationId = salah.id;
      final scheduledTime = salah.time.subtract(
          const Duration(minutes: 15)); // Schedule 30 minutes before salah time
      print(notificationId);
      print(notificationId.toString());

      await AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: notificationId,
          channelKey: notificationId.toString(),
          title: 'Prayer Reminder',
          body: 'It\'s time for ${salah.nameEn} prayer.',
          wakeUpScreen: true,
          category: NotificationCategory.Alarm,
          // customSound: ,
        ),
        schedule: NotificationCalendar(
          preciseAlarm: true,
          repeats: true,
          hour: scheduledTime.hour,
          minute: scheduledTime.minute,
          allowWhileIdle: true,
        ),
      );
    });
  }

  Salah getNextSalah(DateTime now) {
    final salahList = state;
    if (salahList.isEmpty) {
      return Salah(
          id: -1,
          nameEn: 'No Salah',
          nameBn: 'কোন সালাত নেই',
          time: DateTime.now());
    }
    salahList.sort((a, b) => a.time.compareTo(b.time));
    for (int i = 0; i < salahList.length; i++) {
      if (salahList[i].time.isAfter(now)) {
        return salahList[i];
      }
    }
    final nextDay = salahList[0].time.add(const Duration(days: 1));
    Future.delayed(Duration(microseconds: 1), () {
      state = List.from(state);
    });
    return Salah(
        id: salahList[0].id,
        nameEn: salahList[0].nameEn,
        nameBn: salahList[0].nameBn,
        time: nextDay);
  }

  Duration updateRemainingTime() {
    final now = DateTime.now();
    final nextSalah = getNextSalah(now);
    Future.delayed(Duration(microseconds: 1), () {
      state = List.from(state);
    });
    return nextSalah.time.difference(now);
  }

  // Salah getNextSalah(DateTime now) {
  //   final salahList = state;
  //   salahList.sort((a, b) => a.time.compareTo(b.time));
  //   for (int i = 0; i < salahList.length; i++) {
  //     if (salahList[i].time.isAfter(now)) {
  //       return salahList[i];
  //     }
  //   }
  //   return salahList[0];
  // }
}
// -----------------------------------------------------------------------------

final salahProvider =
    StateNotifierProvider<SalahController, List<Salah>>((ref) {
  final gpsController = ref.watch(gpsControllerProvider);
  return SalahController(gpsController: gpsController);
});
