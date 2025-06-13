import 'package:filmler_uygulamasi/models/Kategoriler.dart';

class KategorilerCevap {
  int success;
  List<Kategoriler> list;

  KategorilerCevap({required this.success, required this.list});

  factory KategorilerCevap.fromJson(Map<String, dynamic> jsonMap) {
    final x = jsonMap['kategoriler'] as List;
    List<Kategoriler> list = x.map((e) {
      return Kategoriler.fromJson(e);
    }).toList();

    return KategorilerCevap(success: jsonMap['success'] as int, list: list);
  }
}
