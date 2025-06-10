class CategoryModel {
  String category_id;
  String category_name;

  CategoryModel({required this.category_id, required this.category_name});

  factory CategoryModel.fromJson(Map<String, dynamic> jsonData) {
    return CategoryModel(
      category_id: jsonData['kategori_id']as String,
      category_name: jsonData['kategori_ad']as String, //4:1
    );
  }
}