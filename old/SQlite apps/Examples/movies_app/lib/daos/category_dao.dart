import 'package:movies_app/database_helper.dart';
import 'package:movies_app/models/category_model.dart';

class CategoryDao {
  static Future<List<CategoryModel>> bringThemAll() async {
    final db = await DatabaseHelper.accessToDatabase();
    List<Map<String, dynamic>> listOfMaps = await db.rawQuery(
      'SELECT * FROM categories',
    );

    return List.generate(listOfMaps.length, (index) {
      var item = listOfMaps[index];
      return CategoryModel(
        category_id: item['category_id'],
        category_name: item['category_name'],
      );
    });
  }
}
