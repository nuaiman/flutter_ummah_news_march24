import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:imaan_barometer/features/salah/screens/salah_alarm_screen.dart';
import 'package:intl/intl.dart';

import '../../../core/common/widgets/txt.dart';
import '../../../core/constants/palette.dart';
import '../../../core/constants/svgs.dart';
import '../../../models/salah_alarm.dart';
import '../../language/controller/language_controller.dart';
import '../../notifications/controllers/salah_notification_controller.dart';
import '../../salah/controllers/salah_controller.dart';

class NextPrayerTime extends ConsumerWidget {
  const NextPrayerTime({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(salahProvider);
    ref.watch(salahNotificationProvider);
    final nextSalah =
        ref.watch(salahProvider.notifier).getNextSalah(DateTime.now());
    Duration remainingTime =
        ref.watch(salahProvider.notifier).updateRemainingTime();
    SalahAlarm? salahNotif = ref
        .read(salahNotificationProvider.notifier)
        .getSalahAlarmById(nextSalah.id);
    final languageIsEnglish = ref.watch(languageIsEnglishProvider);

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
                    Txt(
                      !languageIsEnglish
                          ? 'পরবর্তী সালাত ${ref.read(languageIsEnglishProvider.notifier).convertEnglishToBangla(remainingTime.inHours.toString())}:${ref.read(languageIsEnglishProvider.notifier).convertEnglishToBangla((remainingTime.inMinutes.remainder(60)).toString().padLeft(2, '0'))}:${ref.read(languageIsEnglishProvider.notifier).convertEnglishToBangla((remainingTime.inSeconds.remainder(60)).toString().padLeft(2, '0'))}'
                          : 'Next Prayer in ${remainingTime.inHours}:${(remainingTime.inMinutes.remainder(60)).toString().padLeft(2, '0')}:${(remainingTime.inSeconds.remainder(60)).toString().padLeft(2, '0')}',
                      color: Palette.white,
                      fontSize: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .push(SalahAlarmScreen.route(nextSalah));
                      },
                      child: SvgPicture.asset(
                        salahNotif == null
                            ? Svgs.notificationOff
                            : Svgs.notification,
                        colorFilter: ColorFilter.mode(
                          Palette.white,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 32.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Txt(
                  !languageIsEnglish
                      ? '${nextSalah.nameBn} ${ref.read(languageIsEnglishProvider.notifier).convertEnglishToBangla(DateFormat.jm().format(nextSalah.time)).replaceAll('AM', 'এ.ম').replaceAll('PM', 'প.ম')}'
                      : '${nextSalah.nameEn} ${DateFormat.jm().format(nextSalah.time)}',
                  color: Palette.black,
                  fontSize: 40,
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
