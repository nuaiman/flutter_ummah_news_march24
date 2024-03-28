import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:imaan_barometer/core/constants/palette.dart';
import 'package:imaan_barometer/features/quran/controllers/quran_controller.dart';
import 'package:imaan_barometer/features/quran/screens/quran_screen.dart';
import 'package:imaan_barometer/models/quran.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import '../../../core/common/widgets/txt.dart';
import '../../../core/constants/pngs.dart';
import '../../../core/constants/svgs.dart';

class SurahScreen extends ConsumerStatefulWidget {
  final QuranSurah surah;
  final int verseId;

  static route({required QuranSurah surah, int? verseId}) => MaterialPageRoute(
        builder: (context) => SurahScreen(
          surah: surah,
          verseId: verseId ?? 0,
        ),
      );

  const SurahScreen({
    super.key,
    required this.surah,
    this.verseId = 0,
  });

  @override
  SurahScreenState createState() => SurahScreenState();
}

class SurahScreenState extends ConsumerState<SurahScreen> {
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();

  @override
  void initState() {
    super.initState();
    itemPositionsListener.itemPositions.addListener(_scrollListener);
  }

  @override
  void dispose() {
    itemPositionsListener.itemPositions.removeListener(_scrollListener);
    super.dispose();
  }

  void _scrollListener() {
    final positions = itemPositionsListener.itemPositions.value;
    int lastCrossedIndex = -1;

    for (var position in positions) {
      if (position.itemLeadingEdge < 0.8) {
        if (position.index != 0) {
          lastCrossedIndex = position.index;
        }
      } else {
        break;
      }
    }

    if (lastCrossedIndex != -1) {
      ref
          .read(quranProvider.notifier)
          .saveSurahVerseToSharedPreferences(widget.surah.id, lastCrossedIndex);
      // print('Index of the latest item that crossed 0.8: $lastCrossedIndex');
    }
  }

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
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              ref.read(quranProvider.notifier).updateState();
              Navigator.of(context).pop();
            },
            icon: SvgPicture.asset(Svgs.backButton),
          ),
          title: Txt(
            widget.surah.transliterationEn,
            fontSize: 24,
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(Svgs.menu),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: ScrollablePositionedList.builder(
            initialScrollIndex: widget.verseId,
            itemScrollController: itemScrollController,
            itemPositionsListener: itemPositionsListener,
            itemCount: widget.surah.verses.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Column(
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Txt(
                                      widget.surah.transliterationEn,
                                      color: Palette.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    Txt(
                                      widget.surah.name,
                                      color: Palette.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500,
                                    )
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Txt(
                                      widget.surah.translationEn,
                                      color: Palette.white,
                                      fontSize: 18,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                const Divider(
                                  color: Palette.white,
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Txt(
                                      'Total Verse: ${widget.surah.verses.length}',
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
                  ],
                );
              } else {
                final verse = widget.surah.verses[index - 1];
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
              }
            },
          ),
        ),
      ),
    );
  }
}
