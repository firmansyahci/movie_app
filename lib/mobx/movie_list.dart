import 'package:mobx/mobx.dart';
import 'package:movie_app/mobx/movie.dart';

part 'movie_list.g.dart';

class MovieList = _MovieList with _$MovieList;

abstract class _MovieList with Store {
  @observable
  ObservableList<Movie> movies = ObservableList<Movie>.of([
    Movie(
      1,
      'Transformers',
      'Michael Bay',
      '...',
      ObservableList<String>.of(['Action', 'Comedy']),
    ),
    Movie(
      2,
      'Kingsman',
      'Matthew Vaughan',
      '...',
      ObservableList<String>.of(['Comedy', 'Horror']),
    ),
  ]);

  @observable
  ObservableList<String> tags = ObservableList<String>();

  @action
  Movie findById(int id) => movies.firstWhere((movie) => movie.id == id);

  @action
  void addMovie(
      String title, String director, String summary, List<String> tags) {
    final movie = Movie(
        movies.length + 2, title, director, summary, ObservableList.of(tags));
    movies.add(movie);
  }

  @action
  void editMovie(int id, String title, String director, String summary,
      List<String> tags) {
    final movie = Movie(id, title, director, summary, ObservableList.of(tags));
    final movieIndex = movies.indexWhere((mov) => mov.id == id);

    movies[movieIndex] = movie;
  }

  @action
  void deleteMovie(int id) {
    final movieIndex = movies.indexWhere((mov) => mov.id == id);
    movies.removeAt(movieIndex);
  }

  @action
  void addTag(String tag) {
    if (tags.contains(tag)) {
      return;
    }
    tags.add(tag);
  }

  @action
  void deleteTag(String tagId) {
    final tagIndex = tags.indexWhere((tag) => tag == tagId);
    tags.removeAt(tagIndex);
  }

  @action
  void clearTag() {
    tags.clear();
  }
}
