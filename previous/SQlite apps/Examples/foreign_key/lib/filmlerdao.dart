import 'package:foreign_key/database_helper.dart';
import 'package:foreign_key/filmler.dart';
import 'package:foreign_key/kategoriler.dart';
import 'package:foreign_key/yonetmenler.dart';
//composition
class Filmlerdao {
  static Future<List<Filmler>> tumFilmler() async {
    final db = await DatabaseHelper.accessToDatabase();

    List<Map<String, dynamic>> listOfMaps = await db.rawQuery(
      'SELECT * FROM filmler,kategoriler,yonetmenler WHERE filmler.kategori_id = kategoriler.kategori_id AND filmler.film_id = kategoriler.kategori_id',
    );

    return List.generate(listOfMaps.length, (index) {
      var item = listOfMaps[index];

      var kategoriNesnesi = Kategoriler(
        kategori_id: item['kategori_id'],
        kategori_ad: item['kategori_ad'],
      );

      var yonetmenNesnesi = Yonetmenler(
        yonetmen_id: item['yonetmen_id'],
        yonetmen_ad: item['yonetmen_ad'],
      );

      return Filmler(
        film_id: item['film_id'],
        film_ad: item['film_ad'],
        film_yil: item['film_yil'],
        film_resim: item['film_resim'],
        kategoriler: kategoriNesnesi,
        yonetmenler: yonetmenNesnesi,
      );
    });
  }
}
