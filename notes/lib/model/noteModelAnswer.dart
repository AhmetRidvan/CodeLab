import 'package:notes/model/noteModel.dart';

class Notemodelanswer {
  List<Notemodel> list;
  int success;

  Notemodelanswer({required this.list, required this.success});

  factory Notemodelanswer.fromJson(Map<String, dynamic> jsonData) {
    final list = jsonData['notlar'] as List;

    final l =
        list.map((e) {
          return Notemodel.fromJson(e);
        }).toList();

    return Notemodelanswer(list: l, success: jsonData['success'] as int);
  }
}
