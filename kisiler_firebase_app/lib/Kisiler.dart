class Kisiler {
  String kisi_id;
  String kisi_ad;
  String kisi_tel;

  Kisiler(this.kisi_id, this.kisi_ad, this.kisi_tel);

  factory Kisiler.fromJson(String key, Map<String, dynamic> jsonData) {
    return Kisiler(key, jsonData['kisi_ad'] as String, jsonData['kisi_tel'] as String);
  }
}
