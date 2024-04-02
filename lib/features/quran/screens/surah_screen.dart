import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/constants/palette.dart';
import '../../language/controller/language_controller.dart';
import '../controllers/quran_controller.dart';
import '../../../models/quran.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import '../../../core/common/widgets/transparent_appbar.dart';
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
    final languageIsEnglish = ref.watch(languageIsEnglishProvider);
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Pngs.bg),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.only(left: 6, right: 6),
          child: Column(
            children: [
              TransparentAppBar(
                text: !languageIsEnglish
                    ? widget.surah.transliteratioBn
                    : widget.surah.transliterationEn,
                onBackPresses: () {
                  ref.read(quranProvider.notifier).updateState();
                },
              ),
              Expanded(
                child: ScrollablePositionedList.separated(
                  initialScrollIndex: widget.verseId,
                  itemScrollController: itemScrollController,
                  itemPositionsListener: itemPositionsListener,
                  itemCount: widget.surah.verses.length + 1,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 20),
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
                                            !languageIsEnglish
                                                ? widget.surah.transliteratioBn
                                                : widget
                                                    .surah.transliterationEn,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Txt(
                                            !languageIsEnglish
                                                ? widget.surah.translationBn
                                                : widget.surah.translationEn,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Txt(
                                            !languageIsEnglish
                                                ? 'মোট আয়াত: ${ref.read(languageIsEnglishProvider.notifier).convertEnglishToBangla(widget.surah.verses.length.toString())}'
                                                : 'Total Verse: ${widget.surah.verses.length}',
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
                      return Container(
                        decoration: BoxDecoration(
                          color: Palette.liteGrey,
                          borderRadius: BorderRadius.circular(17),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(17),
                                  border: Border.all(color: Palette.green),
                                ),
                                child: Card(
                                  color: Palette.liteGrey,
                                  surfaceTintColor: Palette.liteGrey,
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                SvgPicture.asset(
                                                  Svgs.counterFill,
                                                ),
                                                Txt(
                                                  !languageIsEnglish
                                                      ? ref
                                                          .read(
                                                              languageIsEnglishProvider
                                                                  .notifier)
                                                          .convertEnglishToBangla(
                                                              verse.id
                                                                  .toString())
                                                      : verse.id.toString(),
                                                  color: Palette.white,
                                                  fontSize: 14,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
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
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 16),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                  child: Txt(
                                                !languageIsEnglish
                                                    ? verse.transliterationBn
                                                    : verse.transliterationEn,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
                                              )),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Expanded(
                                                child: Txt(
                                              !languageIsEnglish
                                                  ? verse.translationBn
                                                  : verse.translationEn,
                                              fontSize: 16,
                                            )),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 0,
                                right: 0,
                                child:
                                    SvgPicture.asset(Svgs.cornerDecorTopRight),
                              ),
                              Positioned(
                                bottom: 0,
                                left: 0,
                                child: SvgPicture.asset(
                                    Svgs.cornerDecorBottomLeft),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
