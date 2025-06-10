

import 'package:dic/Kelimeler.dart';

class KelimelerCevap {
  int success;
  List<Kelimeler> listOfKelimeler;

  KelimelerCevap({required this.success, required this.listOfKelimeler});

  factory KelimelerCevap.fromJson(Map<String, dynamic> jsonMap) {
    final jsonlist = jsonMap['kelimeler'] as List;
    final list = jsonlist.map((e) {
      return Kelimeler(
        kelime_id: e['kelime_id'],
        ingilizce: e['ingilizce'],
        turkce: e['turkce'],
      );
    }).toList();
    return KelimelerCevap(success: jsonMap['success'] as int, listOfKelimeler: list);
  }
}
