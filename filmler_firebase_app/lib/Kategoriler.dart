class Kategoriler {
  String kategori_id;
  String kategori_ad;

  Kategoriler(this.kategori_id, this.kategori_ad);

  factory Kategoriler.fromJson(String key,Map<String, dynamic> jsonData) {
   return Kategoriler(key, jsonData['kategori_ad'] as String);
  }
}
