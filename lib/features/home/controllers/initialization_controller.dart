import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imaan_barometer/features/deeds/controllers/deeds_controller.dart';
import 'package:imaan_barometer/features/home/screens/home_screen..dart';

class InitializationContoller extends StateNotifier<bool> {
  final DeedsController _deedsController;
  InitializationContoller({required DeedsController deedsController})
      : _deedsController = deedsController,
        super(false);

  void getAllDeeds(BuildContext context) async {
    await _deedsController.loadDeeds();
    Navigator.of(context).pushAndRemoveUntil(
      HomeScreen.route(),
      (route) => false,
    );
  }
}
// -----------------------------------------------------------------------------

final initializationProvider =
    StateNotifierProvider<InitializationContoller, bool>((ref) {
  final deedsController = ref.watch(deedsProvider.notifier);
  return InitializationContoller(deedsController: deedsController);
});
