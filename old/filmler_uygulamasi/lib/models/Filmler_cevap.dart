import 'package:filmler_uygulamasi/models/Filmler.dart';

class FilmlerCevap {
  int success;
  List<Filmler> list;
  FilmlerCevap({required this.success, required this.list});

  factory FilmlerCevap.fromJson(Map<String, dynamic> JsonData) {
    final x = JsonData['filmler'] as List;

    List<Filmler> list = x.map((e) {
      return Filmler.fromJson(e);
    }).toList();

    return FilmlerCevap(success: JsonData['success'], list: list);
  }
}
