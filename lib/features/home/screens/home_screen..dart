import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:imaan_barometer/core/constants/pngs.dart';
import 'package:imaan_barometer/features/deeds/screens/deeds_screen.dart';
import 'package:imaan_barometer/features/qibla/screens/qibla_screen.dart';
import 'package:imaan_barometer/features/quran/screens/quran_screen.dart';
import 'package:top_modal_sheet/top_modal_sheet.dart';

import '../../../core/constants/palette.dart';
import '../../../core/constants/svgs.dart';
import '../widgets/grid_item_tile.dart';
import '../widgets/top_sheet.dart';

class HomeScreen extends StatelessWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      );
  const HomeScreen({super.key});

  Future<void> _showTopModal(BuildContext context) async {
    await showTopModalSheet(
      context,
      const DummyModal(),
      backgroundColor: Colors.white,
      borderRadius: const BorderRadius.vertical(
        bottom: Radius.circular(20),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Pngs.bg),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const IconButton(
                      onPressed: null,
                      icon: Icon(null),
                    ),
                    IconButton(
                      onPressed: () => _showTopModal(context),
                      icon: SvgPicture.asset(
                        Svgs.dropDown,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        Svgs.menu,
                      ),
                    ),
                  ],
                ),
              ),
              Stack(
                children: [
                  SvgPicture.asset(
                    Svgs.barometerBg,
                  ),
                  // ---------------------------------------------------------------
                  // Column(
                  //   children: [
                  //     SfCartesianChart(
                  //         primaryXAxis: CategoryAxis(),
                  //         primaryYAxis: NumericAxis(
                  //             minimum: 0, maximum: 40, interval: 10),
                  //         tooltipBehavior: TooltipBehavior(enable: true),
                  //         series: <CartesianSeries<_ChartData, String>>[
                  //           ColumnSeries<_ChartData, String>(
                  //             dataSource: data,
                  //             xValueMapper: (_ChartData data, _) => data.x,
                  //             yValueMapper: (_ChartData data, _) => data.y,
                  //             name: 'Gold',
                  //             color: Color.fromRGBO(8, 142, 255, 1),
                  //           )
                  //         ]),
                  //     // -----------------
                  //     // Txt(
                  //     //   'Today',
                  //     //   fontSize: 20,
                  //     // ),
                  //   ],
                  // ),

                  // DeedsChart(),

                  // ---------------------------------------------------------------
                ],
              ),
              SizedBox(height: 8),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GridItemTile(
                        label: 'Deeds',
                        svgPath: Svgs.deeds,
                        onTap: () {
                          Navigator.of(context).push(DeedsScreen.route());
                        },
                      ),
                      const SizedBox(width: 20),
                      GridItemTile(
                        label: 'Quran',
                        svgPath: Svgs.quran,
                        onTap: () {
                          Navigator.of(context).push(QuranScreen.route());
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GridItemTile(
                        label: 'Qibla',
                        svgPath: Svgs.qibla,
                        onTap: () {
                          Navigator.of(context).push(QiblaScreen.route());
                        },
                      ),
                      const SizedBox(width: 20),
                      GridItemTile(
                        label: 'Salah',
                        svgPath: Svgs.salah,
                        onTap: () {},
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Container(
                  height: 191,
                  decoration: BoxDecoration(
                    color: Palette.liteGrey,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 68,
                        decoration: BoxDecoration(
                          color: Palette.green,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Next Prayer in 7:14',
                                style: TextStyle(
                                  color: Palette.white,
                                  fontSize: 20,
                                ),
                              ),
                              SvgPicture.asset(Svgs.notification),
                            ],
                          ),
                        ),
                      ),
                      const Spacer(),
                      const Padding(
                        padding: EdgeInsets.only(left: 32.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Isha - 7:26 PM',
                            style: TextStyle(
                              color: Palette.black,
                              fontSize: 40,
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Ayah of The Day',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      color: Palette.liteGrey,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  '1234324234oidfdfkgdfgj4523eorgjhdfkjghjkthqw4uirthjkpghasdjipgh',
                                  softWrap: true,
                                  style: TextStyle(
                                    fontSize: 24,
                                  ),
                                ),
                              ),
                              SizedBox(width: 20),
                              Icon(
                                CupertinoIcons.heart,
                                size: 40,
                              )
                            ],
                          ),
                          SizedBox(height: 20),
                          Text(
                            '[Quran 8:33]',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
