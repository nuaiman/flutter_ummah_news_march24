import 'package:flutter/material.dart';

import '../../../core/common/widgets/transparent_appbar.dart';
import '../../../core/constants/pngs.dart';

import 'dart:math' as math;

class QiblaScreen extends StatefulWidget {
  const QiblaScreen({Key? key});

  static route() => MaterialPageRoute(
        builder: (context) => const QiblaScreen(),
      );
  @override
  QiblaScreenState createState() => QiblaScreenState();
}

class QiblaScreenState extends State<QiblaScreen> {
  double azimuth = 0; // Device azimuth angle
  final double qiblaDirection = 58.531; // Direction of Mecca in degrees

  @override
  void initState() {
    super.initState();
    // Use the sensor API directly from the Flutter SDK
    // This requires enabling platform channels
    // You may need to handle permissions and check sensor availability on specific platforms
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Pngs.bg),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: Column(
            children: [
              const TransparentAppBar(
                text: 'Qibla',
              ),
              Center(
                child: Transform.rotate(
                  angle: math.pi / 180 * (qiblaDirection - azimuth),
                  child: Icon(Icons
                      .arrow_circle_up_outlined), // Replace with your compass needle image
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
