import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:imaan_barometer/core/constants/palette.dart';
import 'package:imaan_barometer/models/quran.dart';

import '../../../core/common/widgets/green_appbar.dart';
import '../../../core/common/widgets/txt.dart';
import '../../../core/constants/pngs.dart';
import '../../../core/constants/svgs.dart';

class SurahScreen extends StatelessWidget {
  final QuranSurah surah;

  static route({required QuranSurah surah}) => MaterialPageRoute(
        builder: (context) => SurahScreen(
          surah: surah,
        ),
      );

  const SurahScreen({super.key, required this.surah});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GreenAppBar(
        title: surah.transliterationEn,
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
                            left: 12, right: 12, bottom: 12),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Txt(
                                  surah.transliterationEn,
                                  color: Palette.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500,
                                ),
                                Txt(
                                  surah.name,
                                  color: Palette.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500,
                                )
                              ],
                            ),
                            SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Txt(
                                  surah.translationEn,
                                  color: Palette.white,
                                  fontSize: 18,
                                ),
                              ],
                            ),
                            SizedBox(height: 4),
                            Divider(
                              color: Palette.white,
                            ),
                            SizedBox(height: 4),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Txt(
                                  'Total Verse: ${surah.verses.length}',
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
                ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: surah.verses.length,
                  itemBuilder: (context, index) {
                    final verse = surah.verses[index];
                    return Card(
                      color: Palette.liteGrey,
                      surfaceTintColor: Palette.liteGrey,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      Svgs.counterFill,
                                    ),
                                    Txt(
                                      verse.id.toString(),
                                      color: Palette.white,
                                      fontSize: 14,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                    child: Txt(
                                  verse.text,
                                  fontSize: 22,
                                  color: Palette.green,
                                  textDirection: TextDirection.rtl,
                                )),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                      child: Txt(
                                    verse.transliterationEn,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  )),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                    child: Txt(
                                  verse.translationEn,
                                  fontSize: 16,
                                )),
                              ],
                            ),
                          ],
                        ),
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
