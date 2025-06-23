class KisiModel {
  String kisi_ad;
  int kisi_yas;

  KisiModel({required this.kisi_ad, required this.kisi_yas});

  factory KisiModel.fromJson(Map<String, dynamic> jsonData) {
    return KisiModel(
      kisi_ad: jsonData['kisi_ad'] as String,
      kisi_yas: jsonData['kisi_yas'] as int,
    );
  }
}
