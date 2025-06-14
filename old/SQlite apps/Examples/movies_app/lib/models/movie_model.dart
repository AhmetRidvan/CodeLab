import 'package:movies_app/models/category_model.dart';
import 'package:movies_app/models/director_model.dart';

class MovieModel {
  int movie_id;
  String movie_name;
  int movie_age;
  String movie_image;
  CategoryModel categoryModel;
  DirectorModel directorModel;

  MovieModel({
    required this.movie_id,
    required this.movie_name,
    required this.movie_age,
    required this.movie_image,
    required this.categoryModel,
    required this.directorModel,
  });
}
