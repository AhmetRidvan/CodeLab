import 'package:flutter/material.dart';
import 'package:movies_app/daos/movie_dao.dart';
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
    var list = <MovieModel>[];
    list = await MovieDao.bringThemAll(widget.c1.category_id);

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
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 3.5,
              ),
              itemBuilder: (context, index) {
                final item = items[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return DetailScreen(m1: item);
                        },
                      ),
                    );
                  },
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'images/${item.movie_image}',
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        Text(
                          item.movie_name,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
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
