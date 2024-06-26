import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:imaan_barometer/core/common/widgets/txt.dart';
import 'package:imaan_barometer/core/constants/palette.dart';
import 'package:intl/intl.dart';

import '../../../core/constants/svgs.dart';
import '../../../models/deed.dart';
import '../../deeds/controllers/deeds_controller.dart';
import '../../language/controller/language_controller.dart';

class BarometerChart extends ConsumerWidget {
  const BarometerChart({
    super.key,
  });

  double calculatePercentageDeedsDone(List<Deed> deeds) {
    if (deeds.isEmpty) {
      return 0.0;
    }
    int totalDeeds = 77;
    int doneDeeds = deeds.where((deed) => deed.isDone).length;
    return (doneDeeds / totalDeeds) * 100;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(deedsProvider);
    final Map<String, List<Deed>> deeds =
        ref.read(deedsProvider.notifier).getLast7DaysDeeds();
    final todayDeeds = ref.read(deedsProvider.notifier).getDeedsForToday();
    final percentage = calculatePercentageDeedsDone(todayDeeds);
    final languageIsEnglish = ref.watch(languageIsEnglishProvider);
    String getStatus(bool isEnglish, double percentage) {
      if (deeds.isEmpty) {
        return '';
      } else if (percentage <= 0) {
        return '';
      } else if (percentage <= 15) {
        return !isEnglish ? 'অবস্থা: গড়ের নিচে' : 'Status: Below Avegare';
      } else if (percentage <= 25) {
        return !isEnglish ? 'অবস্থা: ফাইন' : 'Status: Avegare';
      } else if (percentage <= 50) {
        return !isEnglish ? 'অবস্থা: ভাল' : 'Status: Good';
      } else if (percentage <= 75) {
        return !isEnglish ? 'অবস্থা: খুব ভালো' : 'Status: Very Good';
      } else {
        return !isEnglish ? 'অবস্থা: চমৎকার' : 'Status: Excellent';
      }
    }

    bool allValuesEmpty(Map<String, List<Deed>> deeds) {
      for (final value in deeds.values) {
        if (value.isNotEmpty) {
          return false;
        }
      }
      return true;
    }

    bool isAllEmpty = allValuesEmpty(deeds);

    return isAllEmpty
        ? SizedBox.shrink()
        : Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(
                Svgs.barometerBg,
              ),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  SvgPicture.asset(
                    !languageIsEnglish
                        ? Svgs.barometerChartBn
                        : Svgs.barometerChart,
                    height: 150,
                  ),
                  BarometerChartBar(
                    xPosition: 7,
                    deeds: deeds['6DaysAgo'] ?? [],
                  ),
                  BarometerChartBar(
                    xPosition: 46,
                    deeds: deeds['5DaysAgo'] ?? [],
                  ),
                  BarometerChartBar(
                    xPosition: 86,
                    deeds: deeds['4DaysAgo'] ?? [],
                  ),
                  BarometerChartBar(
                    xPosition: 126,
                    deeds: deeds['3DaysAgo'] ?? [],
                  ),
                  BarometerChartBar(
                    xPosition: 166,
                    deeds: deeds['2DaysAgo'] ?? [],
                  ),
                  BarometerChartBar(
                    xPosition: 205,
                    deeds: deeds['1DayAgo'] ?? [],
                  ),
                  BarometerChartBar(
                    xPosition: 246,
                    deeds: deeds['Today'] ?? [],
                  ),
                ],
              ),
              Positioned(
                top: 50,
                left: 18,
                child: Txt(
                  !languageIsEnglish
                      ? 'আজ ${ref.read(languageIsEnglishProvider.notifier).convertEnglishToBangla(DateFormat('dd MMMM, yyyy').format(DateTime.now())).replaceAll('January', 'জানুয়ারি').replaceAll('February', 'ফেব্রুয়ারি').replaceAll('March', 'মার্চ').replaceAll('April', 'এপ্রিল').replaceAll('May', 'মে').replaceAll('June', 'জুন').replaceAll('July', 'জুলাই').replaceAll('August', 'অগাস্ট').replaceAll('September', 'সেপ্টেম্বর').replaceAll('October', 'অক্টোবর').replaceAll('November', 'নভেম্বর').replaceAll('December', 'ডিসেম্বর')}'
                      : 'Today ${DateFormat('dd MMMM, yyyy').format(DateTime.now())}',
                  color: Palette.white,
                  fontSize: 20,
                ),
              ),
              Positioned(
                bottom: 50,
                left: 18,
                child: Txt(
                  !languageIsEnglish
                      ? getStatus(languageIsEnglish, percentage)
                      : getStatus(languageIsEnglish, percentage),
                  color: Palette.white,
                  fontSize: 17,
                ),
              ),
            ],
          );
  }
}

class BarometerChartBar extends ConsumerWidget {
  final double xPosition;
  final List<Deed> deeds;
  const BarometerChartBar({
    super.key,
    required this.xPosition,
    required this.deeds,
  });

  double calculatePercentageDeedsDone(List<Deed> deeds) {
    if (deeds.isEmpty) {
      return 0.0;
    }
    int totalDeeds = 77;
    int doneDeeds = deeds.where((deed) => deed.isDone).length;
    return (doneDeeds / totalDeeds) * 100;
  }

  Color getBarColor(double percentage) {
    if (deeds.isEmpty) {
      return Colors.transparent;
    } else if (percentage <= 25) {
      return Palette.veryLowScore;
    } else if (percentage <= 50) {
      return Palette.lowScore;
    } else if (percentage <= 75) {
      return Palette.lime;
    } else {
      return Palette.highScore;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double percentage = calculatePercentageDeedsDone(deeds);
    final languageIsEnglish = ref.watch(languageIsEnglishProvider);
    return Positioned(
      bottom: 0,
      left: xPosition,
      child: Column(
        children: [
          deeds.isEmpty
              ? const Txt('')
              : Txt(
                  !languageIsEnglish
                      ? '${ref.read(languageIsEnglishProvider.notifier).convertEnglishToBangla(percentage.toStringAsFixed(0))} %'
                      : '${percentage.toStringAsFixed(0)} %',
                  fontSize: 10,
                  color: Palette.white,
                ),
          const SizedBox(height: 5),
          Container(
            decoration: BoxDecoration(
              color: getBarColor(percentage),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(3),
                topRight: Radius.circular(3),
              ),
            ),
            width: 20,
            height: deeds.isEmpty ? 0 : (123 * percentage / 100).clamp(0, 123),
          ),
          const SizedBox(height: 3),
          deeds.isEmpty
              ? const Txt('')
              : Txt(
                  deeds[0].dayOfWeek.isEmpty
                      ? ''
                      : !languageIsEnglish
                          ? deeds[0]
                              .dayOfWeek
                              .replaceAll('Monday', 'সোমবার')
                              .replaceAll('Tuesday', 'মঙ্গলবার')
                              .replaceAll('Wednesday', 'বুধবার')
                              .replaceAll('Thursday', 'বৃহস্পতিবার')
                              .replaceAll('Friday', 'শুক্রবার')
                              .replaceAll('Saturday', 'শনিবার')
                              .replaceAll('Sunday', 'রবিবার')
                              .substring(0, 3)
                          : deeds[0].dayOfWeek.substring(0, 3),
                  color: Palette.white,
                ),
        ],
      ),
    );
  }
}
