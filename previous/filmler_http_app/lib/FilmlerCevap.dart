import 'package:filmler_http_app/Filmler.dart';

class Filmlercevap {
  List<Filmler> list;
  int success;

  Filmlercevap(this.list, this.success);

  factory Filmlercevap.fromJson(Map<String, dynamic> jsonData) {
    final m = jsonData['filmler'] as List;

    List<Filmler> list = m.map((e) {
      return Filmler.jromJson(e);
    }).toList();

    return Filmlercevap(list, jsonData['success'] as int);
  }
}
