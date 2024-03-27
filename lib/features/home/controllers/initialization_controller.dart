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
