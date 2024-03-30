import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/constants/pngs.dart';
import '../../deeds/screens/deeds_screen.dart';
import '../../qibla/screens/qibla_screen.dart';
import '../../quran/screens/quran_screen.dart';
import '../../salah/screens/salah_screen.dart';
import 'package:intl/intl.dart';
import 'package:top_modal_sheet/top_modal_sheet.dart';

import '../../../core/constants/palette.dart';
import '../../../core/constants/svgs.dart';
import '../../salah/controllers/salah_controller.dart';
import '../widgets/barometer_chart.dart';
import '../widgets/grid_item_tile.dart';
import '../widgets/top_sheet.dart';

class HomeScreen extends ConsumerStatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      );
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
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
  void initState() {
    ref.read(salahProvider.notifier).getPrayerTimes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(salahProvider);
    final nextSalah =
        ref.watch(salahProvider.notifier).getNextSalah(DateTime.now());
    Duration remainingTime =
        ref.watch(salahProvider.notifier).updateRemainingTime();
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
              BarometerChart(),
              const SizedBox(height: 8),
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
                        onTap: () {
                          Navigator.of(context).push(SalahScreen.route());
                        },
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
                              Text(
                                'Next Prayer in ${remainingTime.inHours}:${(remainingTime.inMinutes.remainder(60)).toString().padLeft(2, '0')}:${(remainingTime.inSeconds.remainder(60)).toString().padLeft(2, '0')}',
                                style: const TextStyle(
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
                      Padding(
                        padding: const EdgeInsets.only(left: 32.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '${nextSalah.nameEn} ${DateFormat.jm().format(nextSalah.time)}',
                            style: const TextStyle(
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
