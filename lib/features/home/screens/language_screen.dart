import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:imaan_barometer/core/common/widgets/transparent_appbar.dart';
import 'package:imaan_barometer/core/constants/palette.dart';

import '../../../core/common/widgets/txt.dart';
import '../../../core/constants/pngs.dart';
import '../../../core/constants/svgs.dart';
import '../../language/controller/language_controller.dart';

class LanguageSettingsScreen extends ConsumerWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const LanguageSettingsScreen(),
      );
  const LanguageSettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final languageIsEnglish = ref.watch(languageIsEnglishProvider);
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Pngs.bg),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // IconButton(
                    //   onPressed: () {
                    //     Navigator.of(context).pop();
                    //   },
                    //   icon: SvgPicture.asset(Svgs.backButton),
                    // ),
                    Txt(
                      '',
                      fontSize: 24,
                    ),
                    Txt(
                      '',
                      fontSize: 24,
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
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, bottom: 16),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: AssetImage(Pngs.greenBg),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 24, horizontal: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Txt(
                                  !languageIsEnglish ? 'ভাষা' : 'Language',
                                  color: Palette.white,
                                  fontSize: 24,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 30),
                          ListTile(
                            onTap: () {
                              ref
                                  .read(languageIsEnglishProvider.notifier)
                                  .toggleLanguage(true);
                            },
                            title: Txt(
                              'English',
                              color: Palette.white,
                              fontSize: 20,
                            ),
                            trailing: Icon(
                              !languageIsEnglish ? null : Icons.check,
                              size: 30,
                              color: Palette.white,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 12),
                            child: Divider(color: Palette.white),
                          ),
                          ListTile(
                            onTap: () {
                              ref
                                  .read(languageIsEnglishProvider.notifier)
                                  .toggleLanguage(false);
                            },
                            title: Txt(
                              'বাংলা',
                              color: Palette.white,
                              fontSize: 20,
                            ),
                            trailing: Icon(
                              languageIsEnglish ? null : Icons.check,
                              size: 30,
                              color: Palette.white,
                            ),
                          ),
                        ],
                      ),
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
