import 'package:flutter/material.dart';
import 'package:movies_app/models/category_model.dart';
import 'package:movies_app/models/director_model.dart';
import 'package:movies_app/models/movie_model.dart';
import 'package:movies_app/views/detail_screen.dart';

class MoviesScreen extends StatefulWidget {
  MoviesScreen({super.key, required this.c1});

  CategoryModel c1;

  @override
  State<MoviesScreen> createState() => _MoviesScreen();
}

class _MoviesScreen extends State<MoviesScreen> {
  Future<List<MovieModel>> bringThemAll(int category_id) async {
    final list = <MovieModel>[];

    CategoryModel c1 = CategoryModel(category_id: 1, category_name: 'Comedy');

    DirectorModel d1 = DirectorModel(
      director_id: 1,
      director_name: 'director_name',
    );

    MovieModel m1 = MovieModel(
      movie_id: 1,
      movie_name: 'Titanic',
      movie_age: 1998,
      movie_image: 'titanic.jpg',
      categoryModel: c1,
      directorModel: d1,
    );

    MovieModel m2 = MovieModel(
      movie_id: 2,
      movie_name: 'The Pianist',
      movie_age: 2003,
      movie_image: 'thepianist.png',
      categoryModel: c1,
      directorModel: d1,
    );
    MovieModel m3 = MovieModel(
      movie_id: 3,
      movie_name: 'Interstellar',
      movie_age: 2002,
      movie_image: 'interstellar.png',
      categoryModel: c1,
      directorModel: d1,
    );

    list.addAll([m1, m2, m3]);

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.c1.category_name} Movies'),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: FutureBuilder(
        future: bringThemAll(widget.c1.category_id),
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
                          return DetailScreen();
                        },
                      ),
                    );
                  },
                  child: SizedBox(
                    height: 70,
                    child: Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text()],
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
