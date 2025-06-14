class Person {
  String kisi_id;
  String kisi_ad;
  String kisi_tel;

  Person({
    required this.kisi_id,
    required this.kisi_ad,
    required this.kisi_tel,
  });

  factory Person.fromJson(Map<String, dynamic> jsonData) {
    return Person(
      kisi_id: jsonData['kisi_id'],
      kisi_ad: jsonData['kisi_ad'],
      kisi_tel: jsonData['kisi_tel'],
    );
  }
}
