class Kelimeler {
  String kelime_id;
  String ingilizce;
  String turkce;

  Kelimeler({required this.kelime_id,required this.ingilizce,required this.turkce});

  factory Kelimeler.fromJson(Map<String, dynamic> jsonData) {
    return Kelimeler(kelime_id: jsonData['kelime_id'] as String, ingilizce: jsonData['ingilizce'] as String, turkce: jsonData['turkce'] as String);
  }
}
