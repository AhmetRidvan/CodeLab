import 'package:json_app2/models/category_model.dart';
import 'package:json_app2/models/director_model.dart';

class MovieModel {
  String movie_id;
  String movie_name;
  String movie_age;
  String movie_image;
  CategoryModel categoryModel; //composition
  DirectorModel directorModel;

  MovieModel({
    required this.movie_id,
    required this.movie_name,
    required this.movie_age,
    required this.movie_image,
    required this.categoryModel,
    required this.directorModel,
  });

  factory MovieModel.fromJson(Map<String, dynamic> jsonData) {
    return MovieModel(
      movie_id: jsonData['film_id'] as String,
      movie_name: jsonData['film_ad'] as String,
      movie_age: jsonData['film_yil'] as String,
      movie_image: jsonData['film_resim'] as String,
      categoryModel: CategoryModel.fromJson(jsonData['kategori']),
      directorModel: DirectorModel.fromJson(jsonData['yonetmen']),
    );
  }
}
