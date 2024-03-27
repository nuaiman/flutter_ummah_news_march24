// // ignore_for_file: public_member_api_docs, sort_constructors_first
// class Deed {
//   final int id;
//   final String title;
//   bool isDone;
//   String dayOfWeek;
//   int day;
//   int month;
//   int year;

//   Deed({
//     required this.id,
//     required this.title,
//     this.isDone = false,
//     required this.dayOfWeek,
//     required this.day,
//     required this.month,
//     required this.year,
//   });

//   @override
//   String toString() {
//     return 'Deed(id: $id, title: $title, isDone: $isDone, dayOfWeek: $dayOfWeek, day: $day, month: $month, year: $year)';
//   }

//   Deed copyWith({
//     int? id,
//     String? title,
//     bool? isDone,
//     String? dayOfWeek,
//     int? day,
//     int? month,
//     int? year,
//   }) {
//     return Deed(
//       id: id ?? this.id,
//       title: title ?? this.title,
//       isDone: isDone ?? this.isDone,
//       dayOfWeek: dayOfWeek ?? this.dayOfWeek,
//       day: day ?? this.day,
//       month: month ?? this.month,
//       year: year ?? this.year,
//     );
//   }

//   @override
//   bool operator ==(covariant Deed other) {
//     if (identical(this, other)) return true;

//     return other.id == id &&
//         other.title == title &&
//         // other.isDone == isDone &&
//         other.dayOfWeek == dayOfWeek &&
//         other.day == day &&
//         other.month == month &&
//         other.year == year;
//   }

//   @override
//   int get hashCode {
//     return id.hashCode ^
//         title.hashCode ^
//         // isDone.hashCode ^
//         dayOfWeek.hashCode ^
//         day.hashCode ^
//         month.hashCode ^
//         year.hashCode;
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'title': title,
//       'isDone': isDone,
//       'dayOfWeek': dayOfWeek,
//       'day': day,
//       'month': month,
//       'year': year,
//     };
//   }

//   factory Deed.fromJson(Map<String, dynamic> json) {
//     return Deed(
//       id: json['id'],
//       title: json['title'],
//       isDone: json['isDone'],
//       dayOfWeek: json['dayOfWeek'],
//       day: json['day'],
//       month: json['month'],
//       year: json['year'],
//     );
//   }
// }

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Deed {
  final int id;
  final String title;
  bool isDone;
  String dayOfWeek;
  int day;
  int month;
  int year;
  DateTime? date;

  Deed({
    required this.id,
    required this.title,
    this.isDone = false,
    required this.dayOfWeek,
    required this.day,
    required this.month,
    required this.year,
    this.date,
  });

  @override
  String toString() {
    return 'Deed(id: $id, title: $title, isDone: $isDone, dayOfWeek: $dayOfWeek, day: $day, month: $month, year: $year, date:$date)';
  }

  Deed copyWith({
    int? id,
    String? title,
    bool? isDone,
    String? dayOfWeek,
    int? day,
    int? month,
    int? year,
    DateTime? date,
  }) {
    return Deed(
      id: id ?? this.id,
      title: title ?? this.title,
      isDone: isDone ?? this.isDone,
      dayOfWeek: dayOfWeek ?? this.dayOfWeek,
      day: day ?? this.day,
      month: month ?? this.month,
      year: year ?? this.year,
      date: date ?? this.date,
    );
  }

  @override
  bool operator ==(covariant Deed other) {
    if (identical(this, other)) return true;

    return other.id == id &&
            other.title == title &&
            // other.isDone == isDone &&
            other.dayOfWeek == dayOfWeek &&
            other.day == day &&
            other.month == month &&
            other.year == year
        // && other.date == date
        ;
  }

  @override
  int get hashCode {
    return id.hashCode ^
            title.hashCode ^
            // isDone.hashCode ^
            dayOfWeek.hashCode ^
            day.hashCode ^
            month.hashCode ^
            year.hashCode
        // ^ date.hashCode
        ;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'isDone': isDone,
      'dayOfWeek': dayOfWeek,
      'day': day,
      'month': month,
      'year': year,
      'date': date,
    };
  }

  factory Deed.fromJson(Map<String, dynamic> json) {
    return Deed(
      id: json['id'],
      title: json['title'],
      isDone: json['isDone'],
      dayOfWeek: json['dayOfWeek'],
      day: json['day'],
      month: json['month'],
      year: json['year'],
      date: json['date'],
    );
  }
}
