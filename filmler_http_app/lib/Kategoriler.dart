class Kategoriler {
  String kategori_id;
  String kategori_ad;

  Kategoriler(this.kategori_id, this.kategori_ad);

  factory Kategoriler.fromJson(Map<String,dynamic> jsonData){
    return Kategoriler(jsonData['kategori_id'] as String, jsonData['kategori_ad'] as String);
  }
}