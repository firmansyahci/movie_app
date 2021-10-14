import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:movie_app/mobx/movie_list.dart';
import 'package:provider/provider.dart';

class MovieListView extends StatelessWidget {
  const MovieListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final movieList = Provider.of<MovieList>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/movie-add');
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Observer(
        builder: (_) => ListView.builder(
            itemCount: movieList.movies.length,
            itemBuilder: (ctx, i) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('/movie-add',
                      arguments: movieList.movies[i].id);
                },
                child: ListTile(
                  title: Text(movieList.movies[i].title),
                  subtitle: Text(movieList.movies[i].director),
                ),
              );
            }),
      ),
    );
  }
}
