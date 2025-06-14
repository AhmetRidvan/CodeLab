import 'package:flutter/material.dart';
import 'package:movies_app/models/movie_model.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen({super.key, required this.m1});

  MovieModel m1;

  @override
  State<DetailScreen> createState() => _DetailScreen();
}

class _DetailScreen extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.m1.movie_name), centerTitle: true),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset('images/${widget.m1.movie_image}', height: 400),
              Text(
                widget.m1.movie_age.toString(),
                style: TextStyle(fontSize: 30),
              ),
              Text(
                widget.m1.directorModel.director_name,
                style: TextStyle(fontSize: 30),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
