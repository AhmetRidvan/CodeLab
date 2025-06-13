import 'package:filmler_uygulamasi/models/Kategoriler.dart';
import 'package:filmler_uygulamasi/models/Yonetmenler.dart';

class Filmler {
  String film_id;
  String film_ad;
  String film_yil;
  String film_resim;
  Kategoriler kategori;
  Yonetmenler yonetmen;

  Filmler({
    required this.film_id,
    required this.film_ad,
    required this.film_yil,
    required this.film_resim,
    required this.kategori,
    required this.yonetmen,
  });

  factory Filmler.fromJson(Map<String, dynamic> jsonData) {
    return Filmler(
      film_id: jsonData['film_id'] as String,
      film_ad: jsonData['film_ad'] as String,
      film_yil: jsonData['film_yil'] as String,
      film_resim: jsonData['film_resim'] as String,
      kategori: Kategoriler.fromJson(jsonData['kategori']),
      yonetmen: Yonetmenler.fromJson(jsonData['yonetmen']),
    );
  }
}
