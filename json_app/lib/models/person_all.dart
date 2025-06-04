import 'package:json_app/models/persons.dart';

class PersonAll {
  int success;
  List<Person> kisiler = [];

  PersonAll({required this.success, required this.kisiler});

  factory PersonAll.fromJson(Map<String, dynamic> jsonData) {
    final jsonList = jsonData['kisiler'] as List;

    List<Person> liste = List.generate(jsonList.length, (index) {
      final item = jsonList[index];
      return Person.fromJson(item);
    });

    return PersonAll(success: jsonData['success'], kisiler: liste);
  }
}
