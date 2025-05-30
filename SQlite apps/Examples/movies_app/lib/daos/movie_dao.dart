import 'package:movies_app/database_helper.dart';
import 'package:movies_app/models/category_model.dart';
import 'package:movies_app/models/director_model.dart';
import 'package:movies_app/models/movie_model.dart';

class MovieDao {
  static Future<List<MovieModel>> bringThemAll(int category_id) async {
    final db = await DatabaseHelper.accessToDatabase();
    List<Map<String, dynamic>> listOfMaps = await db.rawQuery(
      'SELECT * FROM movies,categories,directors WHERE movies.category_id = categories.category_id AND movies.director_id = directors.director_id AND movies.category_id = $category_id',
    );

    return List.generate(listOfMaps.length, (index) {
      var item = listOfMaps[index];

      CategoryModel c1 = CategoryModel(
        category_id: item['category_id'],
        category_name: item['category_name'],
      );

      DirectorModel d1 = DirectorModel(
        director_id: item['director_id'],
        director_name: item['director_name'],
      );
      return MovieModel(
        movie_id: item['movie_id'],
        movie_name: item['movie_name'],
        movie_age: item['movie_age'],
        movie_image: item['movie_image'],
        categoryModel: c1,
        directorModel: d1,
      );
    });
  }
}
