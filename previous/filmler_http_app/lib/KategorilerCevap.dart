import 'package:filmler_http_app/Kategoriler.dart';

class Kategorilercevap {
  List<Kategoriler> kategoriler;
  int success;

  Kategorilercevap(this.kategoriler, this.success);

  factory Kategorilercevap.fromJson(Map<String, dynamic> jsonData) {
    final x = jsonData['kategoriler'] as List;

    List<Kategoriler> list = x.map((e) {
      return Kategoriler(e['kategori_id'], e['kategori_ad']);
    }).toList();

    return Kategorilercevap(list, jsonData['success']);
  }
}
