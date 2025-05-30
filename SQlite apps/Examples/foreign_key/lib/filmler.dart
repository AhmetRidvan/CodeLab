import 'package:foreign_key/kategoriler.dart';
import 'package:foreign_key/yonetmenler.dart';

class Filmler {
  int film_id;
  String film_ad;
  int film_yil;
  String film_resim;
  Kategoriler kategoriler;
  Yonetmenler yonetmenler;

  Filmler({
    required this.film_id, 
    required this.film_ad,
    required this.film_yil,
    required this.film_resim,
    required this.kategoriler,
    required this.yonetmenler,
  });
}
