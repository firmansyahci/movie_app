import 'package:mobx/mobx.dart';

part 'movie.g.dart';

enum Tag { Action, Comedy, Fantasy, Horror, SciFi }

class Movie = _Movie with _$Movie;

abstract class _Movie with Store {
  _Movie(this.id, this.title, this.director, this.summary, this.tags);

  @observable
  int id = 0;

  @observable
  String title = '';

  @observable
  String director = '';

  @observable
  String summary = '';

  @observable
  ObservableList<String> tags = ObservableList<String>();
}
