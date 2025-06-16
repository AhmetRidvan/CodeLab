import 'package:kisiler_http_app/Kisiler.dart';

class KisilerCevap {
  List<Kisiler> list;
  int success;

  KisilerCevap(this.list, this.success);

  factory KisilerCevap.jsonParse(Map<String, dynamic> jsonData) {
    final x = jsonData['kisiler'] as List;

    List<Kisiler> list = List.generate(x.length, (index) {
      return Kisiler.fromJson(x[index]);
    });
    return KisilerCevap(list, jsonData['success'] as int);
  }
}
