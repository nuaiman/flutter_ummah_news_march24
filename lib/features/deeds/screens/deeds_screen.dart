import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../core/common/widgets/transparent_appbar.dart';
import '../../../core/constants/pngs.dart';
import '../../../models/deed.dart';
import '../widgets/deed_tile.dart';

class DeedsScreen extends StatelessWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const DeedsScreen(),
      );

  const DeedsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Pngs.bg),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const TransparentAppBar(
              text: 'Deeds',
            ),
            Expanded(
              child: ListView(
                children: [
                  // DeedTile(
                  //     deed: Deed(
                  //       id: 1,
                  //       titleEn: 'Faith in Allah (Surah Al-Baqarah: 2:258)',
                  //       titleBn: 'আল্লাহর প্রবত ঈমাে আো (সূরা আল-বাকারা: ২৫৮)',
                  //       isDone: false,
                  //       dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
                  //       day: DateTime.now().day,
                  //       month: DateTime.now().month,
                  //       year: DateTime.now().year,
                  //     ),
                  //   ),
                  DeedTile(
                    deed: Deed(
                      id: 1,
                      titleEn: 'Faith in Allah (Surah Al-Baqarah: 2:258)',
                      titleBn: 'আল্লাহর প্রতি ঈমান (সূরা বাকারা : ২৫৮)',
                      isDone: false,
                      dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
                      day: DateTime.now().day,
                      month: DateTime.now().month,
                      year: DateTime.now().year,
                    ),
                  ),
                  DeedTile(
                    deed: Deed(
                      id: 2,
                      titleEn: 'Faith in the Angels (Surah Al-Baqarah: 2:285)',
                      titleBn: 'ফেরেশতাদের প্রতি বিশ্বাস (সূরা বাকারা: ২৮৫)',
                      isDone: false,
                      dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
                      day: DateTime.now().day,
                      month: DateTime.now().month,
                      year: DateTime.now().year,
                    ),
                  ),
                  DeedTile(
                    deed: Deed(
                      id: 3,
                      titleEn:
                          'Faith in the Heavenly Books (Surah Al-Baqarah: 2:285)',
                      titleBn:
                          'আসমানী কিতাবসমূহের প্রতি বিশ্বাস (সূরা বাকারা: ২৮৫)',
                      isDone: false,
                      dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
                      day: DateTime.now().day,
                      month: DateTime.now().month,
                      year: DateTime.now().year,
                    ),
                  ),
                  DeedTile(
                    deed: Deed(
                      id: 4,
                      titleEn:
                          'Faith in the Prophets (Surah Al-Baqarah: 2:136)',
                      titleBn: 'নবীদের প্রতি বিশ্বাস (সূরা বাকারা: ১৩৬)',
                      isDone: false,
                      dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
                      day: DateTime.now().day,
                      month: DateTime.now().month,
                      year: DateTime.now().year,
                    ),
                  ),
                  DeedTile(
                    deed: Deed(
                      id: 5,
                      titleEn: 'Faith in Divine Decree (Surah An-Nisa: 4:78)',
                      titleBn:
                          'খোদায়ী হুকুমের প্রতি বিশ্বাস (সূরা আন-নিসা: ৭৮)',
                      isDone: false,
                      dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
                      day: DateTime.now().day,
                      month: DateTime.now().month,
                      year: DateTime.now().year,
                    ),
                  ),
                  DeedTile(
                    deed: Deed(
                      id: 6,
                      titleEn: 'Faith in the Hereafter (Surah At-Tawbah: 9:29)',
                      titleBn: 'আখেরাতের প্রতি বিশ্বাস (সূরা আত-তওবা: ২৯)',
                      isDone: false,
                      dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
                      day: DateTime.now().day,
                      month: DateTime.now().month,
                      year: DateTime.now().year,
                    ),
                  ),
                  DeedTile(
                    deed: Deed(
                      id: 7,
                      titleBn: 'পুনরুত্থানের প্রতি বিশ্বাস (সূরা তাগাবুন: ৮)',
                      titleEn:
                          'Faith in Resurrection (Surah At-Taghabun: 64:8)',
                      isDone: false,
                      dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
                      day: DateTime.now().day,
                      month: DateTime.now().month,
                      year: DateTime.now().year,
                    ),
                  ),
                  DeedTile(
                    deed: Deed(
                      id: 8,
                      titleBn:
                          'বিচার দিবসে জমায়েতের প্রতি বিশ্বাস (সূরা আল-মুতাফফিফিন: ৪-৬)',
                      titleEn:
                          'Faith in the Gathering on the Day of Judgment (Surah Al-Mutaffifin: 83:4-6)',
                      isDone: false,
                      dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
                      day: DateTime.now().day,
                      month: DateTime.now().month,
                      year: DateTime.now().year,
                    ),
                  ),
                  DeedTile(
                    deed: Deed(
                      id: 9,
                      titleBn:
                          'মুমিনদের জন্য জান্নাত এবং কাফেরদের জন্য জাহান্নাম (সূরা আল বাকারা: ৮১)',
                      titleEn:
                          'Paradise for the Believers and Hell for the Disbelievers (Surah Al-Baqarah: 2:81)',
                      isDone: false,
                      dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
                      day: DateTime.now().day,
                      month: DateTime.now().month,
                      year: DateTime.now().year,
                    ),
                  ),
                  DeedTile(
                    deed: Deed(
                      id: 10,
                      titleBn:
                          'আল্লাহর প্রতি গভীর ভালোবাসা (সূরা বাকারা : ১৭৫)',
                      titleEn: 'Deep Love for Allah (Surah Al-Baqarah: 2:165)',
                      isDone: false,
                      dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
                      day: DateTime.now().day,
                      month: DateTime.now().month,
                      year: DateTime.now().year,
                    ),
                  ),
                  DeedTile(
                    deed: Deed(
                      id: 11,
                      titleBn:
                          'আল্লাহর ভয় সম্পর্কে অবিরাম সচেতনতা (সূরা আল ইমরান: ১৭৫)',
                      titleEn:
                          'Constant Awareness of Allah\'s Fear (Surah Al-Imran: 3:175)',
                      isDone: false,
                      dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
                      day: DateTime.now().day,
                      month: DateTime.now().month,
                      year: DateTime.now().year,
                    ),
                  ),
                  DeedTile(
                    deed: Deed(
                      id: 12,
                      titleBn:
                          'আল্লাহ সম্পর্কে ভালো ধারণা রাখা (সূরা আল আরাফ: ৫৬)',
                      titleEn:
                          'Maintaining Good Thoughts about Allah (Surah Al-A\'raf: 7:56)',
                      isDone: false,
                      dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
                      day: DateTime.now().day,
                      month: DateTime.now().month,
                      year: DateTime.now().year,
                    ),
                  ),
                  DeedTile(
                    deed: Deed(
                      id: 13,
                      titleBn: 'আল্লাহর উপর ভরসা রাখুন (সূরা আল মায়েদাঃ ২৩)',
                      titleEn: 'Trust in Allah (Surah Al-Maidah: 5:23)',
                      isDone: false,
                      dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
                      day: DateTime.now().day,
                      month: DateTime.now().month,
                      year: DateTime.now().year,
                    ),
                  ),
                  DeedTile(
                    deed: Deed(
                      id: 14,
                      titleBn:
                          'আল্লাহর রাসূলের প্রতি ভালবাসা (সহীহ আল বুখারী: ৪৪)',
                      titleEn:
                          'Love for the Messenger of Allah (Sahih Al-Bukhari: 4)',
                      isDone: false,
                      dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
                      day: DateTime.now().day,
                      month: DateTime.now().month,
                      year: DateTime.now().year,
                    ),
                  ),
                  DeedTile(
                    deed: Deed(
                      id: 15,
                      titleBn:
                          'আল্লাহর রাসূলের প্রতি সম্মান ও সহযোগিতা (সূরা আল আরাফ: ১৫৭)',
                      titleEn:
                          'Respect and Cooperation with the Messenger of Allah (Surah Al-A\'raf: 7:157)',
                      isDone: false,
                      dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
                      day: DateTime.now().day,
                      month: DateTime.now().month,
                      year: DateTime.now().year,
                    ),
                  ),
                  DeedTile(
                    deed: Deed(
                      id: 16,
                      titleBn: 'ইসলামে দৃঢ়তা (সহীহ আল-বুখারি: ৪৩)',
                      titleEn: 'Firmness in Islam (Sahih Al-Bukhari: 43)',
                      isDone: false,
                      dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
                      day: DateTime.now().day,
                      month: DateTime.now().month,
                      year: DateTime.now().year,
                    ),
                  ),
                  DeedTile(
                    deed: Deed(
                      id: 17,
                      titleBn: 'জ্ঞান অর্জন (সূরা আলে ইমরান: ১৮)',
                      titleEn:
                          'Acquisition of Knowledge (Surah Al-Imran: 3:18)',
                      isDone: false,
                      dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
                      day: DateTime.now().day,
                      month: DateTime.now().month,
                      year: DateTime.now().year,
                    ),
                  ),
                  DeedTile(
                    deed: Deed(
                      id: 18,
                      titleBn: 'শিক্ষার প্রচার (সূরা আলে ইমরান: ১৮৭)',
                      titleEn: 'Promotion of Education (Surah Al-Imran: 3:187)',
                      isDone: false,
                      dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
                      day: DateTime.now().day,
                      month: DateTime.now().month,
                      year: DateTime.now().year,
                    ),
                  ),
                  DeedTile(
                    deed: Deed(
                      id: 19,
                      titleBn:
                          'মহিমান্বিত কুরআনকে সম্মান করা (সূরা আল ওয়াক্ব: ৭৭-৮০)',
                      titleEn:
                          'Respecting the Glorious Qur\'an (Surah Al-Waqi\'ah: 56:77-80)',
                      isDone: false,
                      dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
                      day: DateTime.now().day,
                      month: DateTime.now().month,
                      year: DateTime.now().year,
                    ),
                  ),
                  DeedTile(
                    deed: Deed(
                      id: 20,
                      titleBn: 'পবিত্রতা অর্জন (সূরা আল মায়িদা: ৫)',
                      titleEn: 'Attaining Purity (Surah Al-Maidah: 5)',
                      isDone: false,
                      dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
                      day: DateTime.now().day,
                      month: DateTime.now().month,
                      year: DateTime.now().year,
                    ),
                  ),
                  DeedTile(
                    deed: Deed(
                      id: 21,
                      titleBn: 'সালাত (নামায/নামাজ) পালন (সূরা আন-নিসা: ১০৩)',
                      titleEn:
                          'Observance of Prayer (Salah) (Surah An-Nisa: 4:103)',
                      isDone: false,
                      dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
                      day: DateTime.now().day,
                      month: DateTime.now().month,
                      year: DateTime.now().year,
                    ),
                  ),
                  DeedTile(
                    deed: Deed(
                      id: 22,
                      titleBn: 'দান খয়রাত (জাকাত) (সূরা আল বাইয়্যিনা: ৫)',
                      titleEn:
                          'Giving Charity (Zakat) (Surah Al-Bayyinah: 98:5)',
                      isDone: false,
                      dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
                      day: DateTime.now().day,
                      month: DateTime.now().month,
                      year: DateTime.now().year,
                    ),
                  ),
                  DeedTile(
                    deed: Deed(
                      id: 23,
                      titleBn: 'রোজা পালন (সিয়াম) (সূরা আল-বাকারা: ১৮৩)',
                      titleEn:
                          'Observing Fasting (Sawm) (Surah Al-Baqarah: 2:183)',
                      isDone: false,
                      dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
                      day: DateTime.now().day,
                      month: DateTime.now().month,
                      year: DateTime.now().year,
                    ),
                  ),
                  DeedTile(
                    deed: Deed(
                      id: 24,
                      titleBn: 'ইতিকাফ (সূরা আল-বাকারা: ১২৫)',
                      titleEn: 'Observing Itikaf (Surah Al-Baqarah: 2:125)',
                      isDone: false,
                      dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
                      day: DateTime.now().day,
                      month: DateTime.now().month,
                      year: DateTime.now().year,
                    ),
                  ),
                  DeedTile(
                    deed: Deed(
                      id: 25,
                      titleBn: 'হজ্জ করা (সূরা আল-ইমরাে: ৯৭)',
                      titleEn: 'Performing the Hajj (Surah Al-Imran: 3:97)',
                      isDone: false,
                      dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
                      day: DateTime.now().day,
                      month: DateTime.now().month,
                      year: DateTime.now().year,
                    ),
                  ),
                  DeedTile(
                    deed: Deed(
                      id: 26,
                      titleBn: 'জিহাদ (সংগ্রাম) (সূরা আল-হজ্জ: ৭৮)',
                      titleEn: 'Engaging in Jihad (Surah Al-Hajj: 22:78)',
                      isDone: false,
                      dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
                      day: DateTime.now().day,
                      month: DateTime.now().month,
                      year: DateTime.now().year,
                    ),
                  ),
                  DeedTile(
                    deed: Deed(
                      id: 27,
                      titleBn:
                          'আল্লাহর পথে জিহাদ করা (মুরাকাবা) (সূরা আলে ইমরান: ২০০)',
                      titleEn:
                          'Striving in the Path of Allah (Muraqabah) (Surah Al-Imran: 3:200)',
                      isDone: false,
                      dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
                      day: DateTime.now().day,
                      month: DateTime.now().month,
                      year: DateTime.now().year,
                    ),
                  ),
                  DeedTile(
                    deed: Deed(
                      id: 28,
                      titleBn:
                          'শত্রুদের মোকাবেলায় দৃঢ় থাকা (সূরা আল-আনফাল: ৪৫)',
                      titleEn:
                          'Being Firm in Facing Enemies (Surah Al-Anfal: 8:45)',
                      isDone: false,
                      dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
                      day: DateTime.now().day,
                      month: DateTime.now().month,
                      year: DateTime.now().year,
                    ),
                  ),
                  DeedTile(
                    deed: Deed(
                      id: 29,
                      titleBn:
                          'গনীমতের ঐশী অংশের উপর আস্থা রাখা (সূরা আল-আনফাল: ৪১)',
                      titleEn:
                          'Trusting in Divine Share of Booty (Surah Al-Anfal: 8:41)',
                      isDone: false,
                      dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
                      day: DateTime.now().day,
                      month: DateTime.now().month,
                      year: DateTime.now().year,
                    ),
                  ),
                  DeedTile(
                    deed: Deed(
                      id: 30,
                      titleBn: 'দাসপ্রথা বিলুপ্তি (সূরা আল বালাদ: ১১- ১৩)',
                      titleEn:
                          'Abolition of Slavery (Surah Al-Balad: 90:11-13)',
                      isDone: false,
                      dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
                      day: DateTime.now().day,
                      month: DateTime.now().month,
                      year: DateTime.now().year,
                    ),
                  ),
                  DeedTile(
                    deed: Deed(
                      id: 31,
                      titleBn: 'কাফফারা (প্রতিকার) (সূরা আল মায়িদাহ: ১)',
                      titleEn:
                          'Making Expiation (Kaffarah) (Surah Al-Maidah: 5:1)',
                      isDone: false,
                      dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
                      day: DateTime.now().day,
                      month: DateTime.now().month,
                      year: DateTime.now().year,
                    ),
                  ),
                  DeedTile(
                    deed: Deed(
                      id: 32,
                      titleBn:
                          'চুক্তি ভঙ্গ করা থেকে বিরত থাকা (সূরা আন-নাহল: ৯১)',
                      titleEn:
                          'Avoiding Breaking Contracts (Surah An-Nahl: 16:91)',
                      isDone: false,
                      dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
                      day: DateTime.now().day,
                      month: DateTime.now().month,
                      year: DateTime.now().year,
                    ),
                  ),
                  DeedTile(
                    deed: Deed(
                      id: 33,
                      titleBn:
                          'আল্লাহর বে\'আমানতর কৃ তজ্ঞতা (সূরা ইব্রাহীম: ৩৪)',
                      titleEn:
                          'Gratitude for Allah\'s Blessings (Surah Ibrahim: 14:34)',
                      isDone: false,
                      dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
                      day: DateTime.now().day,
                      month: DateTime.now().month,
                      year: DateTime.now().year,
                    ),
                  ),
                  DeedTile(
                    deed: Deed(
                      id: 34,
                      titleBn: 'সত্যের উপর অটল থাকা (সূরা আহযাব: ৩৫)',
                      titleEn: 'Staying firm on truth (Surah Al-Ahzab: 33:35)',
                      isDone: false,
                      dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
                      day: DateTime.now().day,
                      month: DateTime.now().month,
                      year: DateTime.now().year,
                    ),
                  ),
                  DeedTile(
                    deed: Deed(
                      id: 35,
                      titleBn: 'আস্থা সংরক্ষণ (সূরা আন-নিসা: ৫৮)',
                      titleEn: 'Preserving Trust (Surah An-Nisa: 4:58)',
                      isDone: false,
                      dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
                      day: DateTime.now().day,
                      month: DateTime.now().month,
                      year: DateTime.now().year,
                    ),
                  ),
                  DeedTile(
                    deed: Deed(
                      id: 36,
                      titleBn: 'হত্যা থেকে বিরত থাকা (সূরা আন-নিসা: ৯৩)',
                      titleEn: 'Abstaining from Killing (Surah An-Nisa: 4:93)',
                      isDone: false,
                      dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
                      day: DateTime.now().day,
                      month: DateTime.now().month,
                      year: DateTime.now().year,
                    ),
                  ),
                  DeedTile(
                    deed: Deed(
                      id: 37,
                      titleBn: 'শালীনতা রক্ষা করা (সূরা আল মুমিনুন: ৫)',
                      titleEn: 'Safeguarding Modesty (Surah Al-Muminun: 23:5)',
                      isDone: false,
                      dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
                      day: DateTime.now().day,
                      month: DateTime.now().month,
                      year: DateTime.now().year,
                    ),
                  ),
                  DeedTile(
                    deed: Deed(
                      id: 38,
                      titleBn:
                          'অন্যায়ভাবে সম্পদ দখল না করা (সূরা বাকারা : ১৮৮)',
                      titleEn:
                          'Not Seizing Property Unjustly (Surah Al-Baqarah: 2:188)',
                      isDone: false,
                      dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
                      day: DateTime.now().day,
                      month: DateTime.now().month,
                      year: DateTime.now().year,
                    ),
                  ),
                  DeedTile(
                    deed: Deed(
                      id: 39,
                      titleBn:
                          'নিষিদ্ধ খাদ্য ও পানীয় থেকে বিরত থাকা (সূরা আল মায়েদাহ: ৩)',
                      titleEn:
                          'Abstaining from Prohibited Food and Drink (Surah Al-Maidah: 5:3)',
                      isDone: false,
                      dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
                      day: DateTime.now().day,
                      month: DateTime.now().month,
                      year: DateTime.now().year,
                    ),
                  ),
                  DeedTile(
                    deed: Deed(
                      id: 40,
                      titleBn:
                          'পোশাক ও সাজসজ্জার ব্যাপারে সতর্কতা (সহীহ মুসলিম: ৫৫৭৪)',
                      titleEn:
                          'Caution Regarding Clothing and Adornment (Sahih Muslim: 5574)',
                      isDone: false,
                      dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
                      day: DateTime.now().day,
                      month: DateTime.now().month,
                      year: DateTime.now().year,
                    ),
                  ),
                  DeedTile(
                    deed: Deed(
                      id: 41,
                      titleBn:
                          'শরীয়তের পরিপন্থী কৌতুকপূর্ণ কাজ ত্যাগ করা (সূরা আল-জুমুআহ: ১১)',
                      titleEn:
                          'Abandoning Playful Actions Contrary to Shariah (Surah Al-Jumu\'ah: 62:11)',
                      isDone: false,
                      dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
                      day: DateTime.now().day,
                      month: DateTime.now().month,
                      year: DateTime.now().year,
                    ),
                  ),
                  DeedTile(
                    deed: Deed(
                      id: 42,
                      titleBn:
                          'আয় ও ব্যয়ের মধ্যে ভারসাম্য বজায় রাখা (সূরা বনি ইসরাঈল: ২৯)',
                      titleEn:
                          'Maintaining Balance between Income and Expenditure (Surah Banī Isrā\'īl: 17:29)',
                      isDone: false,
                      dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
                      day: DateTime.now().day,
                      month: DateTime.now().month,
                      year: DateTime.now().year,
                    ),
                  ),
                  DeedTile(
                    deed: Deed(
                      id: 43,
                      titleBn: 'শত্রুতা ও বিদ্বেষ দূর করা (সূরা আন-নিসা: ৫৪)',
                      titleEn:
                          'Removing Enmity and Hatred (Surah An-Nisa: 4:54)',
                      isDone: false,
                      dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
                      day: DateTime.now().day,
                      month: DateTime.now().month,
                      year: DateTime.now().year,
                    ),
                  ),
                  DeedTile(
                    deed: Deed(
                      id: 44,
                      titleBn:
                          'কাউনক অপবাি ো সিো বা সহে ো করা (সূরা আে েূর: ২৩)',
                      titleEn:
                          'Not Speaking Ill of Others (Surah An-Nur: 24:23)',
                      isDone: false,
                      dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
                      day: DateTime.now().day,
                      month: DateTime.now().month,
                      year: DateTime.now().year,
                    ),
                  ),
                  DeedTile(
                    deed: Deed(
                      id: 45,
                      titleBn: 'ইখলাস (ইখলাস) (সূরা আল বাইয়্যিনা: ৫)',
                      titleEn: 'Sincerity (Ikhlas) (Surah Al-Bayyinah: 98:5)',
                      isDone: false,
                      dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
                      day: DateTime.now().day,
                      month: DateTime.now().month,
                      year: DateTime.now().year,
                    ),
                  ),
                  DeedTile(
                    deed: Deed(
                      id: 46,
                      titleBn:
                          'সৎ কাজে আনন্দ এবং মন্দ কাজে দুঃখ পাওয়া (সূরা আল ইমরান : ১১০)',
                      titleEn:
                          'Finding Joy in Good Deeds and Grief in Evil Deeds(Sura Al-Imran: 110)',
                      isDone: false,
                      dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
                      day: DateTime.now().day,
                      month: DateTime.now().month,
                      year: DateTime.now().year,
                    ),
                  ),
                  DeedTile(
                    deed: Deed(
                      id: 47,
                      titleBn: 'তওবা: পাপের নিরাময় (সূরা আন-নূর: ৩১)',
                      titleEn:
                          'Repentance: Cure for Sins (Surah An-Nur: 24:31)',
                      isDone: false,
                      dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
                      day: DateTime.now().day,
                      month: DateTime.now().month,
                      year: DateTime.now().year,
                    ),
                  ),
                  DeedTile(
                    deed: Deed(
                      id: 48,
                      titleBn:
                          'আল্লাহর নৈকট্য লাভের জন্য আত্মত্যাগ ও আত্মত্যাগ (সূরা আল-হাজ: ৩৬)',
                      titleEn:
                          'Sacrifice and Self-Abandonment for Nearness to Allah (Surah Al-Hajj: 22:36)',
                      isDone: false,
                      dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
                      day: DateTime.now().day,
                      month: DateTime.now().month,
                      year: DateTime.now().year,
                    ),
                  ),
                  DeedTile(
                    deed: Deed(
                      id: 49,
                      titleBn: 'নেতাকে অনুসরণ করা (সূরা আন-নিসা: ৫৮)',
                      titleEn: 'Following the Leader (Surah An-Nisa: 4:58)',
                      isDone: false,
                      dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
                      day: DateTime.now().day,
                      month: DateTime.now().month,
                      year: DateTime.now().year,
                    ),
                  ),
                  DeedTile(
                    deed: Deed(
                      id: 50,
                      titleBn: 'প্রতিশ্রুতিবদ্ধ জীবন যাপন (সূরা আল ইমরান: ১০৩)',
                      titleEn:
                          'Living a Committed Life (Surah Al-Imran: 3:103)',
                      isDone: false,
                      dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
                      day: DateTime.now().day,
                      month: DateTime.now().month,
                      year: DateTime.now().year,
                    ),
                  ),
                  DeedTile(
                    deed: Deed(
                      id: 51,
                      titleBn:
                          'ন্যায়বিচার পরিচালনা এবং সুষ্ঠু সিদ্ধান্ত গ্রহণ (সূরা আন-নিসা: ৫৮)',
                      titleEn:
                          'Administering Justice and Making Fair Decisions (Surah An-Nisa: 4:58)',
                      isDone: false,
                      dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
                      day: DateTime.now().day,
                      month: DateTime.now().month,
                      year: DateTime.now().year,
                    ),
                  ),
                  DeedTile(
                    deed: Deed(
                      id: 52,
                      titleBn:
                          'সৎকাজের আদেশ করা এবং মন্দ কাজের নিষেধ করা (সূরা আলে ইমরান ১০৪)',
                      titleEn:
                          'Enjoining Good and Forbidding Evil (Surah Al-Imran: 3:104)',
                      isDone: false,
                      dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
                      day: DateTime.now().day,
                      month: DateTime.now().month,
                      year: DateTime.now().year,
                    ),
                  ),
                  DeedTile(
                    deed: Deed(
                      id: 53,
                      titleBn: 'নেক কাজে সহযোগিতা করা (সূরা আল মায়েদাহ: ২)',
                      titleEn:
                          'Cooperating in Righteous Deeds (Surah Al-Maidah: 5:2)',
                      isDone: false,
                      dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
                      day: DateTime.now().day,
                      month: DateTime.now().month,
                      year: DateTime.now().year,
                    ),
                  ),
                  DeedTile(
                    deed: Deed(
                      id: 54,
                      titleBn: 'শালীনতা বজায় রাখা (সহীহ বুখারী: ৬১১৭)',
                      titleEn: 'Maintaining Modesty (Sahih Bukhari: 6117)',
                      isDone: false,
                      dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
                      day: DateTime.now().day,
                      month: DateTime.now().month,
                      year: DateTime.now().year,
                    ),
                  ),
                  DeedTile(
                    deed: Deed(
                      id: 55,
                      titleBn: 'পিতামাতার সাথে সদাচরণ করা (সূরা বাকারাঃ ৮৩)',
                      titleEn:
                          'Having Good Conduct with Parents (Surah Al-Baqarah: 2:83)',
                      isDone: false,
                      dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
                      day: DateTime.now().day,
                      month: DateTime.now().month,
                      year: DateTime.now().year,
                    ),
                  ),
                  DeedTile(
                    deed: Deed(
                      id: 56,
                      titleBn:
                          'আত্মীয়-স্বজনদের সাথে সম্পর্ক রক্ষা করা (সূরা বাকারা: ২৭)',
                      titleEn:
                          'Preserving Relationships with Relatives (Surah Al-Baqarah: 2:27)',
                      isDone: false,
                      dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
                      day: DateTime.now().day,
                      month: DateTime.now().month,
                      year: DateTime.now().year,
                    ),
                  ),
                  DeedTile(
                    deed: Deed(
                      id: 57,
                      titleBn: 'সচ্চবরত্র অবলম্বে করা (সূরা আল কলম: ৪)',
                      titleEn:
                          'Upholding Good Character (Surah Al-Qalam: 68:4)',
                      isDone: false,
                      dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
                      day: DateTime.now().day,
                      month: DateTime.now().month,
                      year: DateTime.now().year,
                    ),
                  ),
                  DeedTile(
                    deed: Deed(
                      id: 58,
                      titleBn:
                          'অধীনস্থদের সাথে সুসম্পর্ক বজায় রাখা (সূরা আন-নিসা: ৩৬)',
                      titleEn:
                          'Maintaining Good Relations with Subordinates (Surah An-Nisa: 4:36)',
                      isDone: false,
                      dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
                      day: DateTime.now().day,
                      month: DateTime.now().month,
                      year: DateTime.now().year,
                    ),
                  ),
                  DeedTile(
                    deed: Deed(
                      id: 59,
                      titleBn: 'বান্দাদের অধিকার প্রদান (সহীহ মুসলিমঃ ১৩৩)',
                      titleEn: 'Giving Rights to Servants (Sahih Muslim: 133)',
                      isDone: false,
                      dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
                      day: DateTime.now().day,
                      month: DateTime.now().month,
                      year: DateTime.now().year,
                    ),
                  ),
                  DeedTile(
                    deed: Deed(
                      id: 60,
                      titleBn:
                          'শিশু ও নির্ভরশীলদের অধিকার প্রদান (সূরা আত-তাহরীম: ৬)',
                      titleEn:
                          'Giving Rights to Children and Dependents (Surah At-Tahrim: 66:6)',
                      isDone: false,
                      dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
                      day: DateTime.now().day,
                      month: DateTime.now().month,
                      year: DateTime.now().year,
                    ),
                  ),
                  DeedTile(
                    deed: Deed(
                      id: 61,
                      titleBn:
                          'দ্বীনের খাতিরে সম্পর্ক বজায় রাখা (সূরা আন-নূর : ২৭)',
                      titleEn:
                          'Maintaining Relationships for the Sake of Religion (Surah An-Nur: 24:27)',
                      isDone: false,
                      dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
                      day: DateTime.now().day,
                      month: DateTime.now().month,
                      year: DateTime.now().year,
                    ),
                  ),
                  DeedTile(
                    deed: Deed(
                      id: 62,
                      titleBn: 'সালামের জবাব দেওয়া (সূরা আন-নিসা: ৮৬)',
                      titleEn: 'Responding to Greetings (Surah An-Nisa: 4:86)',
                      isDone: false,
                      dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
                      day: DateTime.now().day,
                      month: DateTime.now().month,
                      year: DateTime.now().year,
                    ),
                  ),
                  DeedTile(
                    deed: Deed(
                      id: 63,
                      titleBn:
                          'অসুস্থ ভাইদের খোঁজ খবর নেওয়া (সহীহ বুখারীঃ ১২৪০)',
                      titleEn:
                          'Inquiring about Sick Brothers (Sahih Bukhari: 1240)',
                      isDone: false,
                      dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
                      day: DateTime.now().day,
                      month: DateTime.now().month,
                      year: DateTime.now().year,
                    ),
                  ),
                  DeedTile(
                    deed: Deed(
                      id: 64,
                      titleBn:
                          'জানাজা ও দাফনে অংশগ্রহণ করা (সহীহ বুখারী: ১২৪০)',
                      titleEn:
                          'Participating in Funerals and Burials (Sahih Bukhari: 1240)',
                      isDone: false,
                      dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
                      day: DateTime.now().day,
                      month: DateTime.now().month,
                      year: DateTime.now().year,
                    ),
                  ),
                  DeedTile(
                    deed: Deed(
                      id: 65,
                      titleBn: 'হাঁচির জবাব দেওয়া (সহীহ বুখারীঃ ১২৪০)',
                      titleEn: 'Responding to Sneezes (Sahih Bukhari: 1240)',
                      isDone: false,
                      dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
                      day: DateTime.now().day,
                      month: DateTime.now().month,
                      year: DateTime.now().year,
                    ),
                  ),
                  DeedTile(
                    deed: Deed(
                      id: 66,
                      titleBn:
                          'কাফেরদের সাথে বন্ধুত্ব না রাখা (সূরা আলে ইমরান: ২৮)',
                      titleEn:
                          'Not Maintaining Friendship with Disbelievers (Surah Al-Imran: 3:28)',
                      isDone: false,
                      dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
                      day: DateTime.now().day,
                      month: DateTime.now().month,
                      year: DateTime.now().year,
                    ),
                  ),
                  DeedTile(
                    deed: Deed(
                      id: 67,
                      titleBn:
                          'প্রতিবেশীদের সাথে মেলামেশা করা (সূরা আন-নিসা: ৩৬)',
                      titleEn:
                          'Interacting with Neighbors (Surah An-Nisa: 4:86)',
                      isDone: false,
                      dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
                      day: DateTime.now().day,
                      month: DateTime.now().month,
                      year: DateTime.now().year,
                    ),
                  ),
                  DeedTile(
                    deed: Deed(
                      id: 68,
                      titleBn: 'অতিথিদের আতিথেয়তা (সূরা আল হাশর: ৯)',
                      titleEn: 'Hosting Guests (Surah Al-Hashr: 9)',
                      isDone: false,
                      dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
                      day: DateTime.now().day,
                      month: DateTime.now().month,
                      year: DateTime.now().year,
                    ),
                  ),
                  DeedTile(
                    deed: Deed(
                      id: 69,
                      titleBn: 'দোষ গোপন রাখা (সূরা আন-নূর: ১৯)',
                      titleEn: 'Keeping Faults Hidden (Surah An-Nur: 24:19)',
                      isDone: false,
                      dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
                      day: DateTime.now().day,
                      month: DateTime.now().month,
                      year: DateTime.now().year,
                    ),
                  ),
                  DeedTile(
                    deed: Deed(
                      id: 70,
                      titleBn:
                          'কষ্টের সময়ে ধৈর্য ধারণ করা (সূরা বাকারা: ১৫৫-১৫৭)',
                      titleEn:
                          'Maintaining Patience in Times of Hardship (Surah Al-Baqarah: 2:155-157)',
                      isDone: false,
                      dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
                      day: DateTime.now().day,
                      month: DateTime.now().month,
                      year: DateTime.now().year,
                    ),
                  ),
                  DeedTile(
                    deed: Deed(
                      id: 71,
                      titleBn:
                          'পরিত্রাণ (ইউহুদ) এবং সীমিত প্রত্যাশা (সূরা মুহাম্মদ: ১৮)',
                      titleEn:
                          'Seeking Salvation (Yuhud) and Limited Expectations (Surah Muhammad: 47:18)',
                      isDone: false,
                      dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
                      day: DateTime.now().day,
                      month: DateTime.now().month,
                      year: DateTime.now().year,
                    ),
                  ),
                  DeedTile(
                    deed: Deed(
                      id: 72,
                      titleBn: 'আত্মসম্মান বজায় রাখা (সূরা আন-নূর: ৩১)',
                      titleEn: 'Maintaining Self-Respect (Surah An-Nur: 24:31)',
                      isDone: false,
                      dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
                      day: DateTime.now().day,
                      month: DateTime.now().month,
                      year: DateTime.now().year,
                    ),
                  ),
                  DeedTile(
                    deed: Deed(
                      id: 73,
                      titleBn:
                          'অপ্রয়োজনীয় কথাবার্তা পরিহার করা (সূরা আল মুমিনুন: ১-৩)',
                      titleEn:
                          'Avoiding Unnecessary Talk (Surah Al-Mu’minun: 23:1-3)',
                      isDone: false,
                      dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
                      day: DateTime.now().day,
                      month: DateTime.now().month,
                      year: DateTime.now().year,
                    ),
                  ),
                  DeedTile(
                    deed: Deed(
                      id: 74,
                      titleBn:
                          'পূণ্যকে উৎসাহিত করা এবং খারাপ কাজকে নিরুৎসাহিত করা (সূরা আন-নিসা: ৩৭)',
                      titleEn:
                          'Encouraging Virtue and Discouraging Vice (Surah An-Nisa: 4:37)',
                      isDone: false,
                      dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
                      day: DateTime.now().day,
                      month: DateTime.now().month,
                      year: DateTime.now().year,
                    ),
                  ),
                  DeedTile(
                    deed: Deed(
                      id: 75,
                      titleBn:
                          'শিশুদের প্রতি স্নেহ প্রদর্শন এবং বড়দের সম্মান করা (সহীহ বুখারী: ৪৮৪২)',
                      titleEn:
                          'Showing Affection to Children and Respecting Elders (Sahih Bukhari: 4842)',
                      isDone: false,
                      dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
                      day: DateTime.now().day,
                      month: DateTime.now().month,
                      year: DateTime.now().year,
                    ),
                  ),
                  DeedTile(
                    deed: Deed(
                      id: 76,
                      titleBn: 'মানুষের মতভেদ মিটমাট করা (সহীহ বুখারীঃ ১২',
                      titleEn:
                          'Reconciling people’s differences (Sahih Bukhari: 12)',
                      isDone: false,
                      dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
                      day: DateTime.now().day,
                      month: DateTime.now().month,
                      year: DateTime.now().year,
                    ),
                  ),
                  DeedTile(
                    deed: Deed(
                      id: 77,
                      titleBn: 'পারস্পরিক সংশোধন (সূরা আে-নিসা: ১১৪)',
                      titleEn: 'Mutual Correction (Surah An-Nisa: 4:114)',
                      isDone: false,
                      dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
                      day: DateTime.now().day,
                      month: DateTime.now().month,
                      year: DateTime.now().year,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
