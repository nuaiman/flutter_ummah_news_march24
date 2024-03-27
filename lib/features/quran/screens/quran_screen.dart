import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:imaan_barometer/core/common/widgets/txt.dart';
import 'package:imaan_barometer/core/constants/svgs.dart';
import 'package:imaan_barometer/features/quran/controllers/quran_controller.dart';
import 'package:imaan_barometer/features/quran/screens/surah_screen.dart';

import '../../../core/common/widgets/green_appbar.dart';
import '../../../core/constants/palette.dart';
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
      appBar: const GreenAppBar(
        title: 'Al-Quran',
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Pngs.bg),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SvgPicture.asset(Svgs.surahCard),
                    Positioned(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 12, right: 12, bottom: 18),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Txt(
                                  'Last Read',
                                  color: Palette.lime,
                                  fontSize: 14,
                                ),
                              ],
                            ),
                            SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Txt(
                                  quran[0].transliterationEn,
                                  color: Palette.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500,
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.arrow_forward,
                                    color: Palette.white,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Txt(
                                  'Verse: ${quran[0].totalVerses}',
                                  color: Palette.white,
                                  fontSize: 18,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                ListView.separated(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: quran.length,
                  separatorBuilder: (context, index) => const Divider(),
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
                            (index + 1).toString(),
                            fontSize: 20,
                            color: Palette.green,
                          ),
                        ],
                      ),
                      title: Txt(
                        surah.transliterationEn,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                      subtitle: Txt(
                        surah.translationEn,
                        fontSize: 18,
                        color: Palette.grey,
                      ),
                      // title: Txt(surah.transliteratioBn),
                      // subtitle: Txt(surah.translationBn),
                      trailing: Txt(
                        surah.name,
                        fontSize: 24,
                        // fontWeight: FontWeight.w600,
                      ),
                    );
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
