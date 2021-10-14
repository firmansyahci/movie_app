// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_list.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MovieList on _MovieList, Store {
  final _$moviesAtom = Atom(name: '_MovieList.movies');

  @override
  ObservableList<Movie> get movies {
    _$moviesAtom.reportRead();
    return super.movies;
  }

  @override
  set movies(ObservableList<Movie> value) {
    _$moviesAtom.reportWrite(value, super.movies, () {
      super.movies = value;
    });
  }

  final _$tagsAtom = Atom(name: '_MovieList.tags');

  @override
  ObservableList<String> get tags {
    _$tagsAtom.reportRead();
    return super.tags;
  }

  @override
  set tags(ObservableList<String> value) {
    _$tagsAtom.reportWrite(value, super.tags, () {
      super.tags = value;
    });
  }

  final _$_MovieListActionController = ActionController(name: '_MovieList');

  @override
  Movie findById(int id) {
    final _$actionInfo =
        _$_MovieListActionController.startAction(name: '_MovieList.findById');
    try {
      return super.findById(id);
    } finally {
      _$_MovieListActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addMovie(
      String title, String director, String summary, List<String> tags) {
    final _$actionInfo =
        _$_MovieListActionController.startAction(name: '_MovieList.addMovie');
    try {
      return super.addMovie(title, director, summary, tags);
    } finally {
      _$_MovieListActionController.endAction(_$actionInfo);
    }
  }

  @override
  void editMovie(int id, String title, String director, String summary,
      List<String> tags) {
    final _$actionInfo =
        _$_MovieListActionController.startAction(name: '_MovieList.editMovie');
    try {
      return super.editMovie(id, title, director, summary, tags);
    } finally {
      _$_MovieListActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteMovie(int id) {
    final _$actionInfo = _$_MovieListActionController.startAction(
        name: '_MovieList.deleteMovie');
    try {
      return super.deleteMovie(id);
    } finally {
      _$_MovieListActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addTag(String tag) {
    final _$actionInfo =
        _$_MovieListActionController.startAction(name: '_MovieList.addTag');
    try {
      return super.addTag(tag);
    } finally {
      _$_MovieListActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteTag(String tagId) {
    final _$actionInfo =
        _$_MovieListActionController.startAction(name: '_MovieList.deleteTag');
    try {
      return super.deleteTag(tagId);
    } finally {
      _$_MovieListActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearTag() {
    final _$actionInfo =
        _$_MovieListActionController.startAction(name: '_MovieList.clearTag');
    try {
      return super.clearTag();
    } finally {
      _$_MovieListActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
movies: ${movies},
tags: ${tags}
    ''';
  }
}
