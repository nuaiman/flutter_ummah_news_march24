import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../../../core/constants/palette.dart';
import '../../../core/constants/svgs.dart';
import '../../salah/controllers/salah_controller.dart';

class NextPrayerTime extends ConsumerWidget {
  const NextPrayerTime({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(salahProvider);
    final nextSalah =
        ref.watch(salahProvider.notifier).getNextSalah(DateTime.now());
    Duration remainingTime =
        ref.watch(salahProvider.notifier).updateRemainingTime();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Container(
        height: 191,
        decoration: BoxDecoration(
          color: Palette.liteGrey,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          children: [
            Container(
              height: 68,
              decoration: BoxDecoration(
                color: Palette.green,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Next Prayer in ${remainingTime.inHours}:${(remainingTime.inMinutes.remainder(60)).toString().padLeft(2, '0')}:${(remainingTime.inSeconds.remainder(60)).toString().padLeft(2, '0')}',
                      style: const TextStyle(
                        color: Palette.white,
                        fontSize: 20,
                      ),
                    ),
                    SvgPicture.asset(Svgs.notification),
                  ],
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 32.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '${nextSalah.nameEn} ${DateFormat.jm().format(nextSalah.time)}',
                  style: const TextStyle(
                    color: Palette.black,
                    fontSize: 40,
                  ),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
