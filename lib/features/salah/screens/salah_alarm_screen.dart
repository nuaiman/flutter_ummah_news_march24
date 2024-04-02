import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:imaan_barometer/core/common/widgets/txt.dart';
import 'package:imaan_barometer/core/constants/palette.dart';

import '../../../core/common/widgets/transparent_appbar.dart';
import '../../../core/constants/pngs.dart';
import '../../../core/constants/svgs.dart';
import '../../../models/salah.dart';
import '../../../models/salah_alarm.dart';
import '../../language/controller/language_controller.dart';
import '../../notifications/controllers/salah_notification_controller.dart';

class SalahAlarmScreen extends ConsumerWidget {
  final Salah salah;
  static route(Salah salah) => MaterialPageRoute(
        builder: (context) => SalahAlarmScreen(
          salah: salah,
        ),
      );
  const SalahAlarmScreen({
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
          padding: const EdgeInsets.only(right: 16, left: 16, bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(null),
                    ),
                    Txt(
                      '',
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: SvgPicture.asset(Svgs.close),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Txt(
                      !languageIsEnglish ? salah.nameBn : salah.nameEn,
                      fontSize: 40,
                      fontWeight: FontWeight.w500,
                    ),
                    Expanded(
                      child: Card(
                        color: Palette.liteGrey,
                        surfaceTintColor: Palette.liteGrey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10),
                            ListTile(
                              onTap: () {
                                ref
                                    .read(salahNotificationProvider.notifier)
                                    .removeSalahAlarm(salah.id, salah);
                              },
                              leading: CircleAvatar(
                                backgroundColor: salahNotif == null
                                    ? Palette.green
                                    : Palette.liteGrey,
                                foregroundColor: Palette.green,
                                radius: 25,
                                child: SvgPicture.asset(
                                  salahNotif == null
                                      ? Svgs.notificationOff
                                      : Svgs.notificationOff,
                                  colorFilter: ColorFilter.mode(
                                      salahNotif == null
                                          ? Palette.white
                                          : Palette.black,
                                      BlendMode.srcIn),
                                ),
                              ),
                              title: Txt(
                                !languageIsEnglish ? 'বন্ধ' : 'Disabled',
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                              ),
                              subtitle: Txt(
                                !languageIsEnglish
                                    ? 'বিজ্ঞপ্তি বন্ধ'
                                    : 'You won\'t be notified',
                                fontSize: 14,
                                color: Palette.grey,
                              ),
                              trailing: salahNotif == null
                                  ? SvgPicture.asset(Svgs.greenTick)
                                  : Icon(null),
                            ),
                            Divider(
                              color: Palette.grey,
                              thickness: 0.5,
                              indent: 80,
                              endIndent: 15,
                            ),
                            // --------------------------------
                            ListTile(
                              onTap: () {
                                ref
                                    .read(salahNotificationProvider.notifier)
                                    .addSalahAlarm(
                                        SalahAlarm(
                                          id: salah.id,
                                          titleEn: salah.nameEn,
                                          titleBn: salah.nameBn,
                                          isAzan: false,
                                          isEnglish: true,
                                          date: salah.time,
                                        ),
                                        salah);
                              },
                              leading: CircleAvatar(
                                backgroundColor: salahNotif != null
                                    ? Palette.green
                                    : Palette.liteGrey,
                                foregroundColor: Palette.green,
                                radius: 25,
                                child: SvgPicture.asset(
                                  salahNotif != null
                                      ? Svgs.notification
                                      : Svgs.notificationBlack,
                                ),
                              ),
                              title: Txt(
                                !languageIsEnglish ? 'চালু' : 'Enabled',
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                              ),
                              subtitle: Txt(
                                !languageIsEnglish
                                    ? 'সতর্কতা দেওয়া হবে'
                                    : 'You will be alerted',
                                fontSize: 14,
                                color: Palette.grey,
                              ),
                              trailing: salahNotif != null
                                  ? SvgPicture.asset(Svgs.greenTick)
                                  : Icon(null),
                            ),
                            Divider(
                              color: Palette.grey,
                              thickness: 0.5,
                              indent: 80,
                              endIndent: 15,
                            ),
                            // --------------------------------
                            ListTile(
                              onTap: () async {
                                if (salahNotif == null) {
                                  await ref
                                      .read(salahNotificationProvider.notifier)
                                      .addSalahAlarm(
                                          SalahAlarm(
                                            id: salah.id,
                                            titleEn: salah.nameEn,
                                            titleBn: salah.nameBn,
                                            isAzan: false,
                                            isEnglish: true,
                                            date: salah.time,
                                          ),
                                          salah);
                                  ref
                                      .read(salahNotificationProvider.notifier)
                                      .toggleSalahAzanStatus(salah.id, salah);
                                } else {
                                  ref
                                      .read(salahNotificationProvider.notifier)
                                      .toggleSalahAzanStatus(salah.id, salah);
                                }
                              },
                              leading: CircleAvatar(
                                backgroundColor:
                                    (salahNotif != null && salahNotif.isAzan)
                                        ? Palette.green
                                        : Palette.liteGrey,
                                foregroundColor: Palette.green,
                                radius: 25,
                                child: SvgPicture.asset(
                                  (salahNotif != null && salahNotif.isAzan)
                                      ? Svgs.notification
                                      : Svgs.notificationBlack,
                                ),
                              ),
                              title: Txt(
                                !languageIsEnglish ? 'আজান' : 'Azan',
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                              ),
                              subtitle: Txt(
                                !languageIsEnglish ? 'আজান' : 'আজান দেওয়া হবে',
                                fontSize: 14,
                                color: Palette.grey,
                              ),
                              trailing:
                                  (salahNotif != null && salahNotif.isAzan)
                                      ? SvgPicture.asset(Svgs.greenTick)
                                      : Icon(null),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
