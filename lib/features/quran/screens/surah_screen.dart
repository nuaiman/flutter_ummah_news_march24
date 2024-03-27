import 'package:al_quran/al_quran.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:imaan_barometer/models/quran.dart';

import '../../../core/common/widgets/green_appbar.dart';
import '../../../core/common/widgets/txt.dart';
import '../../../core/constants/palette.dart';
import '../../../core/constants/pngs.dart';
import '../../../core/constants/svgs.dart';

class SurahScreen extends StatelessWidget {
  final Surah surah;

  static route({required Surah surah}) => MaterialPageRoute(
        builder: (context) => SurahScreen(
          surah: surah,
        ),
      );

  const SurahScreen({super.key, required this.surah});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GreenAppBar(
        title: surah.englishName,
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
                SvgPicture.asset(Svgs.barometerBg),
                ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: surah.ayahs.length,
                  itemBuilder: (context, index) {
                    final verses = surah.ayahs[index];
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                                child: Txt(
                              verses.text,
                              textDirection: TextDirection.rtl,
                            )),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                                child: Txt(
                              AlQuran.surahDetails.byName.alAraf.ayahs[0]
                                  .pronunciationBn,
                            )),
                          ],
                        ),
                      ],
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
