class Notemodel {
  String note_id;
  String lesson_name;
  int grade1;
  int grade2;

  Notemodel({
    required this.note_id,
    required this.lesson_name,
    required this.grade1,
    required this.grade2,
  });

  factory Notemodel.fromJson(String key,Map<String, dynamic> jsonData) {
    return Notemodel(
      note_id: key,
      lesson_name: jsonData['ders_adi'] as String,
      grade1: jsonData['not1'] as int,
      grade2: jsonData['not2'] as int,
    );
  }
}
