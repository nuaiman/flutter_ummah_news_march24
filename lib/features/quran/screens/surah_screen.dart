import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:imaan_barometer/core/constants/palette.dart';
import 'package:imaan_barometer/models/quran.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../core/common/widgets/green_appbar.dart';
import '../../../core/common/widgets/txt.dart';
import '../../../core/constants/pngs.dart';
import '../../../core/constants/svgs.dart';

class SurahScreen extends StatefulWidget {
  final QuranSurah surah;

  static route({required QuranSurah surah}) => MaterialPageRoute(
        builder: (context) => SurahScreen(
          surah: surah,
        ),
      );

  const SurahScreen({Key? key, required this.surah}) : super(key: key);

  @override
  _SurahScreenState createState() => _SurahScreenState();
}

class _SurahScreenState extends State<SurahScreen> {
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();

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
                ); // Replace YourStaticItemWidget with your widget
              } else {
                // Return dynamic items
                final verse = widget.surah.verses[
                    index - 1]; // Subtract 1 to adjust for the static item
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

  // void _scrollListener() {
  //   final positions = itemPositionsListener.itemPositions.value;
  //   // Loop through positions to get the visible items
  //   for (var position in positions) {
  //     print('Item at index ${position.index} is ${position.itemLeadingEdge}');
  //   }
  // }

  // void _scrollListener() {
  //   final positions = itemPositionsListener.itemPositions.value;

  //   for (var position in positions) {
  //     final itemLeadingEdge = position.itemLeadingEdge ?? 0;

  //     // Check if the itemLeadingEdge is within the desired range
  //     if (itemLeadingEdge >= 0 && itemLeadingEdge <= 0.1) {
  //       print('Item at index ${position.index} is within the range 0 to 0.1');
  //       break; // To ensure we only print the first item within the range
  //     }
  //   }
  // }

  // void _scrollListener() {
  //   final positions = itemPositionsListener.itemPositions.value;
  //   final firstPosition = positions.isNotEmpty ? positions.first : null;

  //   if (firstPosition != null && firstPosition.index == 0) {
  //     final itemLeadingEdge = firstPosition.itemLeadingEdge ?? 0;

  //     // Check if the itemLeadingEdge is within the desired range
  //     if (itemLeadingEdge >= 0 && itemLeadingEdge <= 0.1) {
  //       print('Item at index 0 is within the range 0 to 0.1');
  //     }
  //   }
  // }

  void _scrollListener() {
    final positions = itemPositionsListener.itemPositions.value;

    for (var position in positions) {
      if (position.index == 1) {
        print('Position of item at index 1: ${position.itemLeadingEdge}');
      }
    }
  }
}
