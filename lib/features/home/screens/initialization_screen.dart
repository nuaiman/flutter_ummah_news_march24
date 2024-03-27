import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imaan_barometer/core/constants/palette.dart';
import 'package:imaan_barometer/features/home/controllers/initialization_controller.dart';

class InitializationScreen extends ConsumerWidget {
  const InitializationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(initializationProvider.notifier).getAllDeeds(context);
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color: Palette.lime,
        ),
      ),
    );
  }
}
