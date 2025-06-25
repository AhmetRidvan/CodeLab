class Kisiler {
  String kisi_id;
  String kisi_ad;
  String kisi_tel;

  Kisiler({
    required this.kisi_id,
    required this.kisi_ad,
    required this.kisi_tel,
  });

  factory Kisiler.fromJson(String key, Map<String, dynamic> jsonData) {
    return Kisiler(
      kisi_id: key,
      kisi_ad: jsonData['kisi_ad'],
      kisi_tel: jsonData['kisi_tel'],
    );
  }
}
