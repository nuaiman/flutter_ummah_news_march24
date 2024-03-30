import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/constants/palette.dart';
import '../../../core/constants/svgs.dart';
import '../../gps/controllers/gps_controller.dart';

import '../../../core/common/widgets/transparent_appbar.dart';
import '../../../core/common/widgets/txt.dart';
import '../../../core/constants/pngs.dart';

class QiblaScreen extends ConsumerStatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const QiblaScreen(),
      );
  const QiblaScreen({super.key});

  @override
  ConsumerState<QiblaScreen> createState() => _QiblaScreenState();
}

class _QiblaScreenState extends ConsumerState<QiblaScreen> {
  final _deviceSupport = FlutterQiblah.androidDeviceSensorSupport();
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                const TransparentAppBar(
                  text: 'Qibla',
                ),
                FutureBuilder(
                  future: _deviceSupport,
                  builder: (_, AsyncSnapshot<bool?> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    }
                    if (snapshot.hasError) {
                      return Center(
                        child: Text("Error: ${snapshot.error.toString()}"),
                      );
                    }

                    if (snapshot.data != null) {
                      return const QiblahCompass();
                      // return CircularProgressIndicator(
                      //   color: Colors.yellow,
                      // );
                    } else {
                      return const CircularProgressIndicator(
                        color: Colors.indigo,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class QiblahCompass extends ConsumerWidget {
  const QiblahCompass({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamBuilder<QiblahDirection>(
      stream: FlutterQiblah.qiblahStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        if (!snapshot.hasData) {
          return const Center(
            child: Text(
              'No data available',
            ),
          );
        }
        final qiblahDirection = snapshot.data!;
        final northDirection = qiblahDirection.direction;
        final qiblaDirection = qiblahDirection.qiblah % 360;
        // final northDirection = qiblahDirection.direction ?? 0;
        // final qiblaDirection =
        //     qiblahDirection.qiblah != null ? qiblahDirection.qiblah % 360 : 0;
        return Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: <Widget>[
            Transform.rotate(
              angle: (-northDirection * pi / 180),
              child: SvgPicture.asset(
                Svgs.compass,
                height: 280,
                alignment: Alignment.center,
              ),
            ),
            Transform.rotate(
              angle: (-qiblaDirection * pi / 180),
              alignment: Alignment.center,
              child: SvgPicture.asset(
                Svgs.needle,
                height: 190,
                alignment: Alignment.center,
              ),
            ),
            Positioned(
              bottom: -250,
              child: Column(
                children: [
                  Txt(
                    "${northDirection.toStringAsFixed(0)}°N",
                    fontSize: 48,
                    color: Palette.black,
                    fontWeight: FontWeight.w500,
                  ),
                  Txt(
                    ref.watch(gpsControllerProvider).locality,
                    fontSize: 32,
                    color: Palette.black,
                    fontWeight: FontWeight.w500,
                  ),
                  const SizedBox(height: 10),
                  Txt(
                    "Qibla ${qiblaDirection.toStringAsFixed(0)}°",
                    fontSize: 32,
                    color: Palette.black,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
