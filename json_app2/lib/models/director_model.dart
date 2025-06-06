class DirectorModel {
  String director_id;
  String director_name;

  DirectorModel({required this.director_id, required this.director_name});

  factory DirectorModel.fromJson(Map<String, dynamic> jsonData) {
    return DirectorModel(
      director_id: jsonData['yonetmen_id'] as String,
      director_name: jsonData['yonetmen_ad'] as String,
    );
  }
}
