import 'package:al_quran/al_quran.dart';
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
    final quranFromJson = ref.watch(quranProvider);
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
                SvgPicture.asset(Svgs.barometerBg),
                ListView.separated(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: AlQuran.quranDetails.getFullQuran.length,
                  separatorBuilder: (context, index) => const Divider(),
                  itemBuilder: (context, index) {
                    final surah = AlQuran.quranDetails.getFullQuran[index];
                    final surahFromjson = quranFromJson[index];
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
                      // title: Txt(surah.englishName),
                      // subtitle: Txt(surah.englishNameTranslation),
                      title: Txt(surah.englishName),
                      subtitle: Txt(surah.englishNameTranslation),
                      trailing: Txt(surah.name.replaceAll('سُورَةُ', '')),
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
