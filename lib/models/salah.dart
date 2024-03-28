class Salah {
  final String nameEn;
  final String nameBn;
  final DateTime time;
  Salah({
    required this.nameEn,
    required this.nameBn,
    required this.time,
  });

  @override
  String toString() => 'Salah(nameEn: $nameEn, nameBn: $nameBn, time: $time)';

  @override
  bool operator ==(covariant Salah other) {
    if (identical(this, other)) return true;

    return other.nameEn == nameEn &&
        other.nameBn == nameBn &&
        other.time == time;
  }

  @override
  int get hashCode => nameEn.hashCode ^ nameBn.hashCode ^ time.hashCode;

  Salah copyWith({
    String? nameEn,
    String? nameBn,
    DateTime? time,
  }) {
    return Salah(
      nameEn: nameEn ?? this.nameEn,
      nameBn: nameBn ?? this.nameBn,
      time: time ?? this.time,
    );
  }
}
