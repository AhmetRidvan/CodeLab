import 'package:flag_quiz_app/VeritabaniYardimcisi.dart';
import 'package:flag_quiz_app/model/flags.dart';

class FlagsDao {
  static Future<List<FlagModel>> random5() async {
    final db = await DatabaseHelper.databaseHelper();

    List<Map<String, dynamic>> items = await db.rawQuery(
      'SELECT * FROM flags ORDER BY RANDOM() LIMIT 5',
    );

    return List.generate(items.length, (index) {
      final item = items[index];
      return FlagModel(
        flag_id: item['flag_id'],
        flag_name: item['flag_name'],
        flag_image: item['flag_image'],
      );
    });
  }

  static Future<List<FlagModel>> random3Wrong(int correctId) async {
    final db = await DatabaseHelper.databaseHelper();

    List<Map<String, dynamic>> items = await db.rawQuery(
      'SELECT * FROM flags WHERE flag_id != $correctId ORDER BY RANDOM() LIMIT 3',
    );

    return List.generate(items.length, (index) {
      final item = items[index];
      return FlagModel(
        flag_id: item['flag_id'],
        flag_name: item['flag_name'],
        flag_image: item['flag_image'],
      );
    });
  }
}