import 'dart:convert';

class SalahAlarm {
  final int id;
  final String titleEn;
  final String titleBn;
  final bool isAzan;
  final bool isEnglish;
  final DateTime date;
  SalahAlarm({
    required this.id,
    required this.titleEn,
    required this.titleBn,
    required this.isAzan,
    required this.isEnglish,
    required this.date,
  });

  SalahAlarm copyWith({
    int? id,
    String? titleEn,
    String? titleBn,
    bool? isAzan,
    bool? isEnglish,
    DateTime? date,
  }) {
    return SalahAlarm(
      id: id ?? this.id,
      titleEn: titleEn ?? this.titleEn,
      titleBn: titleBn ?? this.titleBn,
      isAzan: isAzan ?? this.isAzan,
      isEnglish: isEnglish ?? this.isEnglish,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'titleEn': titleEn,
      'titleBn': titleBn,
      'isAzan': isAzan,
      'isEnglish': isEnglish,
      'date': date.millisecondsSinceEpoch,
    };
  }

  factory SalahAlarm.fromMap(Map<String, dynamic> map) {
    return SalahAlarm(
      id: map['id'] as int,
      titleEn: map['titleEn'] as String,
      titleBn: map['titleBn'] as String,
      isAzan: map['isAzan'] as bool,
      isEnglish: map['isEnglish'] as bool,
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory SalahAlarm.fromJson(String source) =>
      SalahAlarm.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SalahAlarm(id: $id, titleEn: $titleEn, titleBn: $titleBn, isAzan: $isAzan, isEnglish: $isEnglish, date: $date)';
  }

  @override
  bool operator ==(covariant SalahAlarm other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.titleEn == titleEn &&
        other.titleBn == titleBn &&
        other.isAzan == isAzan &&
        other.isEnglish == isEnglish &&
        other.date == date;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        titleEn.hashCode ^
        titleBn.hashCode ^
        isAzan.hashCode ^
        isEnglish.hashCode ^
        date.hashCode;
  }
}
