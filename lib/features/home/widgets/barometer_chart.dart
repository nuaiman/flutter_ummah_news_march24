import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:imaan_barometer/core/common/widgets/txt.dart';

import '../../../core/constants/svgs.dart';

class BarometerChart extends StatelessWidget {
  const BarometerChart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        SvgPicture.asset(
          Svgs.barometerBg,
        ),
        Stack(
          clipBehavior: Clip.none,
          children: [
            SvgPicture.asset(
              Svgs.barometerChart,
              height: 160,
            ),
            BarometerChartBar(
              xPosition: 9,
            ),
            BarometerChartBar(
              xPosition: 51,
            ),
            BarometerChartBar(
              xPosition: 93,
            ),
            BarometerChartBar(
              xPosition: 136,
            ),
            BarometerChartBar(
              xPosition: 178,
            ),
            BarometerChartBar(
              xPosition: 221,
            ),
            BarometerChartBar(
              xPosition: 263,
            ),
          ],
        ),
      ],
    );
  }
}

class BarometerChartBar extends StatelessWidget {
  final double xPosition;
  const BarometerChartBar({
    super.key,
    required this.xPosition,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 5,
      left: xPosition,
      child: Column(
        children: [
          Txt('asd'),
          Container(
            width: 20,
            height: (131 / 77) * 10,
            color: Colors.white,
          ),
          Txt('asd'),
        ],
      ),
    );
  }
}
