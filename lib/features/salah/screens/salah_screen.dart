import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:imaan_barometer/core/common/widgets/txt.dart';
import 'package:imaan_barometer/core/constants/palette.dart';
import 'package:imaan_barometer/core/constants/svgs.dart';
import 'package:imaan_barometer/features/salah/controllers/salah_controller.dart';
import 'package:intl/intl.dart';

import '../../../core/common/widgets/transparent_appbar.dart';
import '../../../core/constants/pngs.dart';
import '../../../models/salah.dart';

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
              const TransparentAppBar(
                text: 'Salah',
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      children: [
                        ListTile(
                          title: Txt(
                            'Next Prayer in ${remainingTime.inHours}:${(remainingTime.inMinutes.remainder(60)).toString().padLeft(2, '0')}:${(remainingTime.inSeconds.remainder(60)).toString().padLeft(2, '0')}',
                            fontSize: 17,
                          ),
                          subtitle: Txt(
                            '${nextSalah.nameEn} ${DateFormat.jm().format(nextSalah.time)}',
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

class SalahTimeTile extends StatelessWidget {
  final Salah salah;
  const SalahTimeTile({
    super.key,
    required this.salah,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Palette.liteGrey,
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
                    onPressed: () {},
                    icon: SvgPicture.asset(Svgs.notificationBlack),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Txt(
                salah.nameEn,
                fontSize: 28,
                fontWeight: FontWeight.w700,
              ),
              Txt(
                DateFormat.jm().format(salah.time),
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
