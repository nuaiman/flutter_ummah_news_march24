import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:imaan_barometer/core/common/widgets/txt.dart';
import 'package:imaan_barometer/core/constants/palette.dart';
import 'package:imaan_barometer/core/constants/svgs.dart';
import 'package:imaan_barometer/features/quran/controllers/quran_controller.dart';
import 'package:imaan_barometer/features/quran/screens/surah_screen.dart';

import '../../../core/constants/pngs.dart';

class QuranScreen extends ConsumerWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const QuranScreen(),
      );
  const QuranScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quran = ref.watch(quranProvider);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Palette.green,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
        toolbarHeight: 120,
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
                  title: Txt(
                    'Al-Quran',
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: Palette.white,
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
                      'Read in the name of Allah',
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
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Pngs.bg),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // SafeArea(
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       const IconButton(
              //         onPressed: null,
              //         icon: Icon(null),
              //       ),
              //       IconButton(
              //         onPressed: () {},
              //         icon: Icon(null),
              //       ),
              //       IconButton(
              //         onPressed: () {},
              //         icon: SvgPicture.asset(
              //           Svgs.menu,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              ListView.separated(
                primary: false,
                shrinkWrap: true,
                itemCount: quran.length,
                separatorBuilder: (context, index) => Divider(),
                itemBuilder: (context, index) {
                  final surah = quran[index];
                  return ListTile(
                    onTap: () {
                      Navigator.of(context)
                          .push(SurahScreen.route(surah: surah));
                    },
                    leading: Stack(
                      alignment: Alignment.center,
                      children: [
                        SvgPicture.asset(Svgs.counterStroke),
                        Txt(
                          surah.id.toString(),
                          fontSize: 20,
                          color: Palette.green,
                        ),
                      ],
                    ),
                    title: Txt(surah.transliteration),
                    subtitle: Txt(surah.translationEn),
                    trailing: Txt(surah.name),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
