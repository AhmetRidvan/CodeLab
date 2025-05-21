import 'package:sqflite/sqlite_api.dart';
import 'package:sqlite_usage/database_helper.dart';
import 'package:sqlite_usage/models/person_model.dart';

class PersonDao {
  static Future<List<PersonModel>> allPersons() async {
    List<PersonModel> list = [];
    final db = await DatabaseHelper.accessToDatabase();
    List<Map<String, dynamic>> data = await db.rawQuery(
      'SELECT * FROM persons',
    );

    list = List.generate(data.length, (index) {
      final item = data[index];
      return PersonModel(
        person_id: item['person_id'],
        person_name: item['person_name'],
        person_age: item['person_age'],
      );
    });

    return list;
  }

  static Future<void> addPerson(String person_name, int person_age) async {
    final db = await DatabaseHelper.accessToDatabase();

    final map = <String, dynamic>{};

    map['person_name'] = person_name;
    map['person_age'] = person_age;

    await db.insert('persons', map);
  }

  static Future delete(int id) async {
    final db = await DatabaseHelper.accessToDatabase();
    await db.delete('persons', where: 'person_id = ?', whereArgs: [id]);
  }

  static Future<void> upgrade(String name, int age, int id) async {
    final db = await DatabaseHelper.accessToDatabase();

    Map<String, dynamic> myMap = {};
    myMap['person_name'] = name;
    myMap['person_age'] = age;

    await db.update('persons', myMap, where: 'person_id = ?', whereArgs: [id]);
  }

  static Future<int> count(String name) async {
    final db = await DatabaseHelper.accessToDatabase();

    List<Map<String, dynamic>> listOfMaps = await db.rawQuery(
      'SELECT count(*) AS xxx FROM persons WHERE person_name = "$name"',
    );
    return listOfMaps[0]['xxx'];
  }
}
