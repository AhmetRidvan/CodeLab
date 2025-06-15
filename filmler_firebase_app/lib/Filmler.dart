import 'package:filmler_firebase_app/Kategoriler.dart';


class Filmler {
  String film_id;
  String film_ad;
  int film_yil;
  String film_resim;
  String kategori_ad;
  String yonetmen_ad;

  Filmler(
    this.film_id,
    this.film_ad,
    this.film_yil,
    this.film_resim,
    this.kategori_ad,
    this.yonetmen_ad,
  );

  factory Filmler.fromJson(String key, Map<String, dynamic> jsonData) {
    return Filmler(
      key,
      jsonData['film_ad'] as String,
      jsonData['film_yil'] as int,
      jsonData['film_resim'] as String,
      jsonData['kategori_ad'] as String,
      jsonData['yonetmen_ad'] as String,
    );
  }
}
