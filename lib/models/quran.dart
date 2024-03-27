class QuranSurah {
  final int id;
  final String name;
  final int totalVerses;
  final String translationBn;
  final String translationEn;
  final String transliterationEn;
  final String transliteratioBn;
  final String type;
  final List<QuranVerse> verses;

  QuranSurah({
    required this.id,
    required this.name,
    required this.totalVerses,
    required this.translationBn,
    required this.translationEn,
    required this.transliterationEn,
    required this.transliteratioBn,
    required this.type,
    required this.verses,
  });

  factory QuranSurah.fromJson(Map<String, dynamic> json) {
    return QuranSurah(
      id: json['id'],
      name: json['name'],
      totalVerses: json['total_verses'],
      translationBn: json['translation_bn'],
      translationEn: json['translation_en'],
      transliterationEn: json['transliteration_en'],
      transliteratioBn: json['transliteration_bn'],
      type: json['type'],
      verses: List<QuranVerse>.from(
          json['verses'].map((verse) => QuranVerse.fromJson(verse))),
    );
  }
}

class QuranVerse {
  final int id;
  final String text;
  final String translationBn;
  final String translationEn;
  final String transliterationBn;
  final String transliterationEn;

  QuranVerse({
    required this.id,
    required this.text,
    required this.translationBn,
    required this.translationEn,
    required this.transliterationBn,
    required this.transliterationEn,
  });

  factory QuranVerse.fromJson(Map<String, dynamic> json) {
    return QuranVerse(
      id: json['id'],
      text: json['text'],
      translationBn: json['translation_bn'],
      translationEn: json['translation_en'],
      transliterationBn: json['transliteration_bn'],
      transliterationEn: json['transliteration_en'],
    );
  }
}
