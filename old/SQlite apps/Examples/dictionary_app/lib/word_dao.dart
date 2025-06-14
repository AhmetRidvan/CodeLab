import 'package:dictionary_app/database_helper.dart';
import 'package:dictionary_app/model/word_model.dart';

class WordDao {
  static Future<List<WordModel>> bringThemAll() async {
    final db = await DatabaseHelper.accessToDatabase();

    List<Map<String, dynamic>> items = await db.rawQuery('SELECT * FROM words');

    return List.generate(items.length, (index) {
      final item = items[index];
      return WordModel(
        word_id: item['word_id'],
        english: item['english'],
        turkish: item['turkish'],
      );
    });
  }

  static Future<List<WordModel>> search(String word) async {
    final db = await DatabaseHelper.accessToDatabase();

    List<Map<String, dynamic>> items = await db.rawQuery(
      'SELECT * FROM words WHERE english LIKE "%$word%"', //16 10
    );
  

    return List.generate(items.length, (index) {
      final item = items[index];
      return WordModel(
        word_id: item['word_id'],
        english: item['english'],
        turkish: item['turkish'],
      );
    });
  }
}
