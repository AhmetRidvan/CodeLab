import 'package:json_app2/models/movie_model.dart';

class AnswerModel {
  int success;
  List<MovieModel> movieList;

  AnswerModel({required this.success, required this.movieList});

  factory AnswerModel.fromJson(Map<String, dynamic> jsonData) {
    var list = jsonData['filmler'] as List;
    return AnswerModel(
      success: jsonData['success'] as int,
      movieList: list.map((e) {
        return MovieModel.fromJson(e);
      }).toList(),
    );
  }
}
