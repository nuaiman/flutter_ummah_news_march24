import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:imaan_barometer/features/notifications/controllers/salah_notification_controller.dart';
import 'package:imaan_barometer/features/salah/screens/salah_alarm_screen.dart';
import '../../../core/common/widgets/txt.dart';
import '../../../core/constants/palette.dart';
import '../../../core/constants/svgs.dart';
import '../../../models/salah_alarm.dart';
import '../../language/controller/language_controller.dart';
import '../controllers/salah_controller.dart';
import 'package:intl/intl.dart';

import '../../../core/common/widgets/transparent_appbar.dart';
import '../../../core/constants/pngs.dart';
import '../../../models/salah.dart';
import '../../gps/controllers/gps_controller.dart';

class SalahScreen extends ConsumerWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const SalahScreen(),
      );
  const SalahScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final salah = ref.watch(salahProvider);
    final nextSalah =
        ref.read(salahProvider.notifier).getNextSalah(DateTime.now());
    Duration remainingTime =
        ref.read(salahProvider.notifier).updateRemainingTime();
    final gps = ref.read(gpsControllerProvider);
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
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TransparentAppBar(
                text: '${gps.locality}, ${gps.isoCountryCode}',
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      children: [
                        ListTile(
                          title: Txt(
                            !languageIsEnglish
                                ? 'পরবর্তী সালাত ${ref.read(languageIsEnglishProvider.notifier).convertEnglishToBangla(remainingTime.inHours.toString())}:${ref.read(languageIsEnglishProvider.notifier).convertEnglishToBangla((remainingTime.inMinutes.remainder(60)).toString().padLeft(2, '0'))}:${ref.read(languageIsEnglishProvider.notifier).convertEnglishToBangla((remainingTime.inSeconds.remainder(60)).toString().padLeft(2, '0'))}'
                                : 'Next Prayer in ${remainingTime.inHours}:${(remainingTime.inMinutes.remainder(60)).toString().padLeft(2, '0')}:${(remainingTime.inSeconds.remainder(60)).toString().padLeft(2, '0')}',
                            fontSize: 17,
                          ),
                          subtitle: Txt(
                            !languageIsEnglish
                                ? '${nextSalah.nameBn} ${ref.read(languageIsEnglishProvider.notifier).convertEnglishToBangla(DateFormat.jm().format(nextSalah.time)).replaceAll('AM', 'এ.ম').replaceAll('PM', 'প.ম')}'
                                : '${nextSalah.nameEn} ${DateFormat.jm().format(nextSalah.time)}',
                            fontSize: 40,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            SalahTimeTile(
                              salah: salah[0],
                            ),
                            const SizedBox(width: 20),
                            SalahTimeTile(
                              salah: salah[1],
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            SalahTimeTile(
                              salah: salah[2],
                            ),
                            const SizedBox(width: 20),
                            SalahTimeTile(
                              salah: salah[3],
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            SalahTimeTile(
                              salah: salah[4],
                            ),
                            const SizedBox(width: 20),
                            SalahTimeTile(
                              salah: salah[5],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SalahTimeTile extends ConsumerWidget {
  final Salah salah;
  const SalahTimeTile({
    super.key,
    required this.salah,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(salahNotificationProvider);
    SalahAlarm? salahNotif = ref
        .read(salahNotificationProvider.notifier)
        .getSalahAlarmById(salah.id);
    final languageIsEnglish = ref.watch(languageIsEnglishProvider);
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: salahNotif != null ? Palette.green : Palette.liteGrey,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).push(SalahAlarmScreen.route(salah));
                    },
                    icon: SvgPicture.asset(
                      salahNotif != null
                          ? Svgs.notificationBlack
                          : Svgs.notificationOff,
                      colorFilter: ColorFilter.mode(
                        salahNotif != null ? Palette.white : Palette.black,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Txt(
                !languageIsEnglish ? salah.nameBn : salah.nameEn,
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: salahNotif != null ? Palette.white : Palette.black,
              ),
              Txt(
                !languageIsEnglish
                    ? ref
                        .read(languageIsEnglishProvider.notifier)
                        .convertEnglishToBangla(
                            DateFormat.jm().format(salah.time))
                        .replaceAll('AM', 'এ.ম')
                        .replaceAll('PM', 'প.ম')
                    : DateFormat.jm().format(salah.time),
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: salahNotif != null ? Palette.white : Palette.black,
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
