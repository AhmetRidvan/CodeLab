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
}
