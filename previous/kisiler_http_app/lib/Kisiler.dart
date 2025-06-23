class Kisiler {
  String kisi_id;
  String kisi_ad;
  String kisi_tel;

  Kisiler(this.kisi_id, this.kisi_ad, this.kisi_tel);

  factory Kisiler.fromJson(Map<String, dynamic> jsonData) {
    return Kisiler(
      jsonData['kisi_id'] as String,
      jsonData['kisi_ad'] as String,
      jsonData['kisi_tel'] as String,
    );
  }
}
