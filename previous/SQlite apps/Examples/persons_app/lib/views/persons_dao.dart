import 'package:persons_app/database_helper.dart';
import 'package:persons_app/models/person_model.dart';

class PersonsDao {
  static Future<List<PersonModel>> bringThemAll() async {
    final db = await DatabaseHelper.veritabaniErisim();

    List<Map<String, dynamic>> x = await db.rawQuery('SELECT * FROM persons');

    return List.generate(x.length, (index) {
      final item = x[index];
      return PersonModel(
        person_id: item['person_id'],
        person_name: item['person_name'],
        person_number: item['person_number'],
      );
    });
  }

  static Future<List<PersonModel>> search(String word) async {
    final db = await DatabaseHelper.veritabaniErisim();

    List<Map<String, dynamic>> x = await db.rawQuery(
      'SELECT * FROM persons WHERE person_name LIKE "%$word%"',
    );

    return List.generate(x.length, (index) {
      final item = x[index];
      return PersonModel(
        person_id: item['person_id'],
        person_name: item['person_name'],
        person_number: item['person_number'],
      );
    });
  }

  static Future<void> add(String word, String number) async {
    final db = await DatabaseHelper.veritabaniErisim();

    Map<String, dynamic> map = {};

    map['person_name'] = word;
    map['person_number'] = number;

    await db.insert('persons', map);
  }

  static Future<void> upgrade(int id, String word, String number) async {
    final db = await DatabaseHelper.veritabaniErisim();

    Map<String, dynamic> map = {};

    map['person_name'] = word;
    map['person_number'] = number;

    await db.update('persons', map, where: 'person_id =?', whereArgs: [id]);
  }

  static Future<void> delete(int id) async {
    final db = await DatabaseHelper.veritabaniErisim();

    await db.delete('persons', where: 'person_id = ?', whereArgs: [id]);
  }
}
