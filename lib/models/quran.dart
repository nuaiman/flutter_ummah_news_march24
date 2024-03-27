class QuranSurah {
  final int id;
  final String name;
  final int totalVerses;
  final String translationBn;
  final String translationEn;
  final String transliteration;
  final String type;
  final List<QuranVerse> verses;

  QuranSurah({
    required this.id,
    required this.name,
    required this.totalVerses,
    required this.translationBn,
    required this.translationEn,
    required this.transliteration,
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
      transliteration: json['transliteration'],
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

  QuranVerse({
    required this.id,
    required this.text,
    required this.translationBn,
    required this.translationEn,
  });

  factory QuranVerse.fromJson(Map<String, dynamic> json) {
    return QuranVerse(
      id: json['id'],
      text: json['text'],
      translationBn: json['translation_bn'],
      translationEn: json['translation_en'],
    );
  }
}
