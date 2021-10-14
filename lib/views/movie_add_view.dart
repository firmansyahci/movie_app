import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:movie_app/mobx/movie_list.dart';
import 'package:provider/provider.dart';

class MovieAddView extends StatefulWidget {
  final int? id;

  MovieAddView({this.id});

  @override
  _MovieAddViewState createState() => _MovieAddViewState();
}

class _MovieAddViewState extends State<MovieAddView> {
  final _titleController = TextEditingController();
  final _directorController = TextEditingController();
  final _summaryController = TextEditingController();

  var movieId;

  final tagList = ['Action', 'Comedy', 'Fantasy', 'Horror', 'Sci-Fi'];

  @override
  void didChangeDependencies() {
    var movieList = Provider.of<MovieList>(context, listen: false);
    movieList.clearTag();
    movieId = ModalRoute.of(context)?.settings.arguments;
    if (movieId != null) {
      var movie = movieList.findById(movieId as int);
      _titleController.text = movie.title;
      _directorController.text = movie.director;
      _summaryController.text = movie.summary;
      movie.tags.forEach((tag) {
        movieList.addTag(tag);
      });
    }
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _directorController.dispose();
    _summaryController.dispose();
  }

  void _deleteMovie() {
    Provider.of<MovieList>(context, listen: false).deleteMovie(movieId);
    Navigator.of(context).pop();
  }

  void _saveForm() {
    final movieList = Provider.of<MovieList>(context, listen: false);
    if (movieId == null) {
      movieList.addMovie(_titleController.text, _directorController.text,
          _summaryController.text, movieList.tags);
    } else {
      movieList.editMovie(
        movieId,
        _titleController.text,
        _directorController.text,
        _summaryController.text,
        movieList.tags,
      );
    }
    Navigator.of(context).pop();
  }

  void _deleteTag(String tagId) {
    Provider.of<MovieList>(context, listen: false).deleteTag(tagId);
  }

  void _addTag(String tagId) {
    Provider.of<MovieList>(context, listen: false).addTag(tagId);
  }

  void _showTagDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: tagList
                  .map(
                    (tag) => GestureDetector(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(tag),
                      ),
                      onTap: () {
                        _addTag(tag);
                        Navigator.of(context).pop();
                      },
                    ),
                  )
                  .toList(),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final movieList = Provider.of<MovieList>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: movieId == null ? Text('New Movie') : Text('Update Movie'),
        actions: [
          if (movieId != null)
            IconButton(
              onPressed: () {
                _deleteMovie();
              },
              icon: Icon(Icons.delete),
            ),
          IconButton(
            onPressed: () {
              _saveForm();
            },
            icon: movieId == null ? Icon(Icons.save) : Icon(Icons.edit),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              autofocus: true,
              decoration: const InputDecoration(
                labelText: 'Title',
                contentPadding: EdgeInsets.all(8),
              ),
              textInputAction: TextInputAction.next,
              controller: _titleController,
            ),
            TextField(
              autofocus: true,
              decoration: const InputDecoration(
                labelText: 'Director',
                contentPadding: EdgeInsets.all(8),
              ),
              textInputAction: TextInputAction.next,
              controller: _directorController,
            ),
            SizedBox(height: 8),
            GestureDetector(
              onTap: () {
                _showTagDialog();
              },
              child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Observer(
                          builder: (_) => movieList.tags.isEmpty
                              ? Text('Tags')
                              : Wrap(
                                  children: movieList.tags
                                      .map((tag) => Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: Chip(
                                              label: Text(tag),
                                              deleteIcon: Icon(Icons.close),
                                              onDeleted: () {
                                                print(tag);
                                                _deleteTag(tag);
                                              },
                                            ),
                                          ))
                                      .toList(),
                                ),
                        ),
                      ),
                      Icon(Icons.arrow_drop_down),
                    ],
                  )),
            ),
            TextField(
              autofocus: true,
              decoration: const InputDecoration(
                labelText: 'Summary',
                contentPadding: EdgeInsets.all(8),
              ),
              textInputAction: TextInputAction.done,
              controller: _summaryController,
            ),
          ],
        ),
      ),
    );
  }
}
