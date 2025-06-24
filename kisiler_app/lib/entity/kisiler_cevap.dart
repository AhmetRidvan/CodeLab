import 'package:kisiler_app/entity/kisiler.dart';

class KisilerCevap {
  List<Kisiler> list;
  int success;

  KisilerCevap({required this.list, required this.success});

  factory KisilerCevap.fromJson(Map<String, dynamic> JsonData) {
    int suc = JsonData['success'] as int;
    final x = JsonData['kisiler'] as List;

    List<Kisiler> list = x.map((e) {
      return Kisiler.fromJson(e);
    }).toList();

    return KisilerCevap(list: list, success: suc);
  }
}
