import 'package:flutter/material.dart';
import 'package:flutterblocapp/bloc/get_movies_bloc.dart';
import 'package:flutterblocapp/bloc/get_movies_by_genre_bloc.dart';
import 'package:flutterblocapp/models/movie.dart';
import 'package:flutterblocapp/models/movie_response.dart';

class GenreMovies extends StatefulWidget {
  final int genreId;

  GenreMovies({Key key, @required this.genreId}) : super(key: key);
  @override
  _GenreMoviesState createState() => _GenreMoviesState(genreId);
}

class _GenreMoviesState extends State<GenreMovies> {
  final int genreId;

  _GenreMoviesState(this.genreId);
  @override
  void initState() {
    super.initState();
    moviesByGenreBloc.getMoviesByGenre(this.genreId);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: moviesByGenreBloc.subjet.stream,
        builder: (context, AsyncSnapshot<MovieResponse> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.error != null && snapshot.data.error.length > 0) {
              return _buildErrorWidget(snapshot.data.error);
            }
            return _buildMoviesByGenreWidget(snapshot.data);
          } else if (snapshot.hasError) {
            return _buildErrorWidget(snapshot.error);
          } else {
            return _buildLoadingWidget();
          }
        });
  }

  Widget _buildLoadingWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 25.0,
            width: 25.0,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              strokeWidth: 4.0,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildErrorWidget(String error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text("Error occured: $error")],
      ),
    );
  }

  Widget _buildMoviesByGenreWidget(MovieResponse data) {
    final List<Movie> movies;
  }
}
