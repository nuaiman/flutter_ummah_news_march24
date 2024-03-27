import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imaan_barometer/features/deeds/controllers/deeds_controller.dart';
import 'package:imaan_barometer/features/home/screens/home_screen..dart';

import '../../quran/controllers/quran_controller.dart';

class InitializationContoller extends StateNotifier<bool> {
  final DeedsController _deedsController;
  final QuranController _quranController;
  InitializationContoller({
    required DeedsController deedsController,
    required QuranController quranController,
  })  : _deedsController = deedsController,
        _quranController = quranController,
        super(false);

  void getAllDeeds(BuildContext context) async {
    await _deedsController.loadDeeds();
    if (context.mounted) {
      await _quranController.loadQuranSurahs(context);
    }
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
  final deedsController = ref.watch(deedsProvider.notifier);
  final quranController = ref.watch(quranProvider.notifier);
  return InitializationContoller(
    deedsController: deedsController,
    quranController: quranController,
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

    