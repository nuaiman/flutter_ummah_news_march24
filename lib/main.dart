import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imaan_barometer/features/home/screens/initialization_screen.dart';

import 'core/constants/palette.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor:
        Colors.transparent, // Change this to your desired status bar color
    statusBarIconBrightness: Brightness.dark, // Set this to Brightness.dark
  ));
  runApp(const ProviderScope(child: BarometerOfImaan()));
}

class BarometerOfImaan extends StatelessWidget {
  const BarometerOfImaan({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Barometer of Imaan',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Palette.green,
        ),
        useMaterial3: true,
      ),
      home: const InitializationScreen(),
    );
  }
}
