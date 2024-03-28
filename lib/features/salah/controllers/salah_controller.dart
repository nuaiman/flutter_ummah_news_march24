import 'dart:async';

import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imaan_barometer/features/gps/controllers/gps_controller.dart';
import 'package:imaan_barometer/models/salah.dart';

import '../../../models/gps.dart';

class SalahController extends StateNotifier<List<Salah>> {
  final GpsModel _gpsController;
  SalahController({required GpsModel gpsController})
      : _gpsController = gpsController,
        super([]);

  Duration updateRemainingTime() {
    final now = DateTime.now();
    final nextSalah = getNextSalah(now);
    return nextSalah.time.difference(now);
  }

  Future<void> getPrayerTimes() async {
    final myCoordinates =
        Coordinates(_gpsController.latitude, _gpsController.longitude);
    final params = CalculationMethod.karachi.getParameters();
    params.madhab = Madhab.hanafi;
    final prayerTimes = PrayerTimes.today(myCoordinates, params);
    final salahList = [
      Salah(nameEn: 'Fazr', nameBn: 'ফজর', time: prayerTimes.fajr),
      Salah(nameEn: 'Sunrise', nameBn: 'সূর্যোদয়', time: prayerTimes.sunrise),
      Salah(nameEn: 'Dhuhr', nameBn: 'জোহর', time: prayerTimes.dhuhr),
      Salah(nameEn: 'Asr', nameBn: 'আসর', time: prayerTimes.asr),
      Salah(nameEn: 'Magrib', nameBn: 'মাগরিব', time: prayerTimes.maghrib),
      Salah(nameEn: 'Isha', nameBn: 'ইশা', time: prayerTimes.isha),
    ];
    Future.delayed(const Duration(microseconds: 10), () {
      state = salahList;
    });
  }

  Salah getNextSalah(DateTime now) {
    final salahList = state;
    salahList.sort((a, b) => a.time.compareTo(b.time));
    for (int i = 0; i < salahList.length; i++) {
      if (salahList[i].time.isAfter(now)) {
        return salahList[i];
      }
    }
    return salahList[0];
  }
}
// -----------------------------------------------------------------------------

final salahProvider =
    StateNotifierProvider<SalahController, List<Salah>>((ref) {
  final gpsController = ref.watch(gpsControllerProvider);
  return SalahController(gpsController: gpsController);
});