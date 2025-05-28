import 'package:notes_app/database_helper.dart';
import 'package:notes_app/model/note_model.dart';
import 'package:sqflite/sqflite.dart';

class NoteDao {
  static Future<List<NoteModel>> bringThemAll() async {
    final db = await DatabaseHelper.accessToDatase();
    List<Map<String, dynamic>> items = await db.rawQuery('SELECT * FROM notes');
    return List.generate(items.length, (index) {
      var item = items[index];
      return NoteModel(
        note_id: item['note_id'],
        lesson_name: item['lesson_name'],
        grade1: item['grade1'],
        grade2: item['grade2'],
      );
    });
  }

  static Future<void> add(String lessonName, int gr1, int gr2) async {
    final db = await DatabaseHelper.accessToDatase();
    Map<String, dynamic> map = {
      'lesson_name': lessonName,
      'grade1': gr1,
      'grade2': gr2,
    };
    await db.insert('notes', map);
  }

  static Future<void> upgrade(
    int note_id,
    String lessonName,
    int gr1,
    int gr2,
  ) async {
    final db = await DatabaseHelper.accessToDatase();
    Map<String, dynamic> map = {
      'lesson_name': lessonName,
      'grade1': gr1,
      'grade2': gr2,
    };
    await db.update('notes', map, where: 'note_id = ?', whereArgs: [note_id]);
  }

  static Future<void> delete(int note_id) async {
    final db = await DatabaseHelper.accessToDatase();

    await db.delete('notes', where: 'note_id = ?', whereArgs: [note_id]);
  }
}
