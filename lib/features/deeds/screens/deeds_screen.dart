import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:imaan_barometer/core/constants/palette.dart';
import 'package:imaan_barometer/core/constants/pngs.dart';
import 'package:imaan_barometer/core/constants/svgs.dart';
import 'package:intl/intl.dart';

import '../../../core/common/widgets/txt.dart';
import '../../../models/deed.dart';
import '../widgets/deed_tile.dart';

class DeedsScreen extends StatelessWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const DeedsScreen(),
      );

  const DeedsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Palette.green,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
        toolbarHeight: 170,
        flexibleSpace: Stack(
          children: [
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(30)),
                  image: DecorationImage(
                    image: AssetImage(Pngs.appBarBg),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Column(
              children: [
                AppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  leading: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: SvgPicture.asset(Svgs.backButton),
                  ),
                  actions: [
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(Svgs.menuWhite),
                    ),
                  ],
                ),
                const Spacer(),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Txt(
                      'Deeds',
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      color: Palette.white,
                    ),
                    Txt(
                      'Do good in the name of Allah',
                      fontSize: 24,
                      color: Palette.lime,
                    ),
                    SizedBox(height: 16),
                  ],
                ),
                const Spacer(),
              ],
            ),
          ],
        ),
      ),
      // -----------------------------------------------------------------------
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Pngs.bg),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          children: [
            DeedTile(
              deed: Deed(
                id: 1,
                title: 'Title 1',
                isDone: false,
                dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
                day: DateTime.now().day,
                month: DateTime.now().month,
                year: DateTime.now().year,
              ),
            ),
            DeedTile(
              deed: Deed(
                id: 2,
                title: 'Title 2',
                isDone: false,
                dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
                day: DateTime.now().day,
                month: DateTime.now().month,
                year: DateTime.now().year,
              ),
            ),
            DeedTile(
              deed: Deed(
                id: 3,
                title: 'Title 3',
                isDone: false,
                dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
                day: DateTime.now().day,
                month: DateTime.now().month,
                year: DateTime.now().year,
              ),
            ),
            DeedTile(
              deed: Deed(
                id: 4,
                title: 'Title 4',
                isDone: false,
                dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
                day: DateTime.now().day,
                month: DateTime.now().month,
                year: DateTime.now().year,
              ),
            ),
            DeedTile(
              deed: Deed(
                id: 5,
                title: 'Title 5',
                isDone: false,
                dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
                day: DateTime.now().day,
                month: DateTime.now().month,
                year: DateTime.now().year,
              ),
            ),
            DeedTile(
              deed: Deed(
                id: 6,
                title: 'Title 6',
                isDone: false,
                dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
                day: DateTime.now().day,
                month: DateTime.now().month,
                year: DateTime.now().year,
              ),
            ),
            DeedTile(
              deed: Deed(
                id: 7,
                title: 'Title 7',
                isDone: false,
                dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
                day: DateTime.now().day,
                month: DateTime.now().month,
                year: DateTime.now().year,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
