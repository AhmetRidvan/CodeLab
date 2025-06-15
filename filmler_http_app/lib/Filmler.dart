import 'package:filmler_http_app/Kategoriler.dart';
import 'package:filmler_http_app/Yonetmenler.dart';

class Filmler {
  String film_id;
  String film_ad;
  String film_yil;
  String film_resim;
  Kategoriler kategori;
  Yonetmenler yonetmen;

  Filmler(
    this.film_id,
    this.film_ad,
    this.film_yil,
    this.film_resim,
    this.kategori,
    this.yonetmen,
  );

  factory Filmler.jromJson(Map<String, dynamic> jsonData) {
    Kategoriler k = Kategoriler.fromJson(jsonData['kategori']);
    Yonetmenler y = Yonetmenler.fromJson(jsonData['yonetmen']);
    return Filmler(
      jsonData['film_id'] as String,
      jsonData['film_ad'] as String,
      jsonData['film_yil'] as String,
      jsonData['film_resim'] as String, 
      k,
      y,
    );
  }
}
