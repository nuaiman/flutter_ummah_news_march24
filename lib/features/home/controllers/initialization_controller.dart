import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imaan_barometer/features/language/controller/language_controller.dart';
import 'package:imaan_barometer/features/notifications/controllers/salah_notification_controller.dart';
import '../../deeds/controllers/deeds_controller.dart';
import '../../gps/controllers/gps_controller.dart';
import '../screens/home_screen.dart';

import '../../quran/controllers/quran_controller.dart';

class InitializationContoller extends StateNotifier<bool> {
  final LanguageController _languageController;
  final DeedsController _deedsController;
  final QuranController _quranController;
  final GpsController _gpsController;
  final SalahNotificationController _salahNotificationController;
  InitializationContoller({
    required LanguageController languageController,
    required DeedsController deedsController,
    required QuranController quranController,
    required GpsController gpsController,
    required SalahNotificationController salahNotificationController,
  })  : _languageController = languageController,
        _deedsController = deedsController,
        _quranController = quranController,
        _gpsController = gpsController,
        _salahNotificationController = salahNotificationController,
        super(false);

  void getAllDeeds(BuildContext context) async {
    // final locationPermission = await _gpsController.checkLocationPermission();
    // if (!locationPermission) {
    //   if (context.mounted) {
    //     showDialog(
    //       context: context,
    //       builder: (context) => AlertDialog(
    //         title: const Text('Location Permission'),
    //         content: const Text(
    //             'Please enable location service and allow lcoation permission from settings.'),
    //         actions: [
    //           TextButton(
    //               onPressed: () {
    //                 exit(0);
    //               },
    //               child: const Text('Close')),
    //         ],
    //       ),
    //     );
    //   }
    //   return;
    // }

    // final location = await _gpsController.getCurrentLocation();
    // if (location.latitude == 0 ||
    //     location.longitude == 0 ||
    //     location.street == '' ||
    //     location.locality == '' ||
    //     location.subAdministrativeArea == '' ||
    //     location.administrativeArea == '' ||
    //     location.country == '' ||
    //     location.isoCountryCode == '') {
    //   if (context.mounted) {
    //     showDialog(
    //       context: context,
    //       builder: (context) => AlertDialog(
    //         title: const Text('Location Error'),
    //         content: const Text(
    //             'Couldn\'t get current location details. Please restart..'),
    //         actions: [
    //           TextButton(
    //               onPressed: () {
    //                 exit(0);
    //               },
    //               child: const Text('Close')),
    //         ],
    //       ),
    //     );
    //   }
    //   return;
    // }
    await _languageController.loadLanguage();
    await _gpsController.checkPermissionAndFetchLocation(context);

    await _deedsController.loadDeeds();
    if (context.mounted) {
      await _quranController.loadQuranSurahs(context);
    }
    await _quranController.getSurahFromSharedPreferences();

    await _salahNotificationController.loadSalahAlarms();

    if (context.mounted) {
      Navigator.of(context).pushAndRemoveUntil(
        HomeScreen.route(),
        (route) => false,
      );
    }
  }
}
// -----------------------------------------------------------------------------

final initializationProvider =
    StateNotifierProvider<InitializationContoller, bool>((ref) {
  final languageController = ref.watch(languageIsEnglishProvider.notifier);
  final deedsController = ref.watch(deedsProvider.notifier);
  final quranController = ref.watch(quranProvider.notifier);
  final gpsController = ref.watch(gpsControllerProvider.notifier);
  final salahNotificationController =
      ref.watch(salahNotificationProvider.notifier);
  return InitializationContoller(
    languageController: languageController,
    deedsController: deedsController,
    quranController: quranController,
    gpsController: gpsController,
    salahNotificationController: salahNotificationController,
  );
});




  // // Specify the path to the external storage directory
  //   final externalDirPath = '/storage/emulated/0/Download';

  //   // Determine the file path where the JSON file will be saved in the external storage directory
  //   final filePath = '$externalDirPath/surah_data.json';

  //   List<Map<String, dynamic>> surahDataList = [];

  //   // Iterate over each Surah from 1 to 114
  //   for (int i = 1; i <= 114; i++) {
  //     // Access the Surah information by Surah number
  //     final surah = AlQuran.surahDetails.bySurahNumber(i);

  //     // Create a list to hold Ayah data
  //     List<Map<String, dynamic>> ayahDataList = [];

  //     // Iterate over each Ayah in the Surah
  //     surah.ayahs.forEach((ayah) {
  //       // Extract relevant data for each Ayah
  //       Map<String, dynamic> ayahData = {
  //         'number': ayah.number,
  //         'translation_bn': ayah.translateBn,
  //         'transliteration_bn': ayah.pronunciationBn,
  //         // Add more fields as needed
  //       };

  //       // Add Ayah data to the list
  //       ayahDataList.add(ayahData);
  //     });

  //     // Extract relevant data for the Surah
  //     Map<String, dynamic> surahData = {
  //       'id': surah.number,
  //       'verses': ayahDataList,
  //       // Add more fields as needed
  //     };

  //     // Add Surah data to the list
  //     surahDataList.add(surahData);
  //   }

  //   // Convert the list to JSON
  //   String jsonString = jsonEncode(surahDataList);

  //   // Write JSON data to the file
  //   File(filePath).writeAsString(jsonString);

  //   print('JSON data saved to $filePath');

    