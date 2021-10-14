import 'package:flutter/material.dart';
import 'package:movie_app/views/movie_add_view.dart';
import 'package:movie_app/mobx/movie_list.dart';
import 'package:movie_app/views/movie_list_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<MovieList>(create: (_) => MovieList()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/': (_) => MovieListView(),
          '/movie-add': (_) => MovieAddView(),
        },
        initialRoute: '/',
      ),
    );
  }
}
