import 'package:flutter/material.dart';
import 'package:movies_app/models/category_model.dart';
import 'package:movies_app/views/detail_screen.dart';
import 'package:movies_app/views/movies_screen.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesState();
}

class _CategoriesState extends State<CategoriesScreen> {
  Future<List<CategoryModel>> bringThemAll() async {
    final list = <CategoryModel>[];
    list.add(CategoryModel(category_id: 1, category_name: 'Horror'));
    list.add(CategoryModel(category_id: 2, category_name: 'Comedy'));

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Categories'), centerTitle: true),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: FutureBuilder(
        future: bringThemAll(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final items = snapshot.data;
            return ListView.builder(
              itemBuilder: (context, index) {
                final item = items[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return MoviesScreen(c1: item,);
                        },
                      ),
                    );
                  },
                  child: SizedBox(
                    height: 70,
                    child: Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text(item.category_name)],
                      ),
                    ),
                  ),
                );
              },
              itemCount: items!.length,
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
