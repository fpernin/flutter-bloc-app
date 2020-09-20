import 'package:flutter/material.dart';
import 'package:flutterblocapp/bloc/get_genres_bloc.dart';
import 'package:flutterblocapp/models/genre.dart';
import 'package:flutterblocapp/models/genre_response.dart';
import 'package:flutterblocapp/widgets/genres_list.dart';

class GenresWidget extends StatefulWidget {
  @override
  _GenresWidgetState createState() => _GenresWidgetState();
}

class _GenresWidgetState extends State<GenresWidget> {
  @override
  void initState() {
    super.initState();
    genresBloc.getGenres();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<GenreResponse>(
      stream: genresBloc.subjet.stream,
      builder: (context, AsyncSnapshot<GenreResponse> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.error != null && snapshot.data.error.length > 0) {
            return _buildErrorWidget(snapshot.data.error);
          }
          return _buildGenresWidget(snapshot.data);
        } else if (snapshot.hasError) {
          return _buildErrorWidget(snapshot.error);
        } else {
          return _buildLoadingWidget();
        }
      },
    );
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

  Widget _buildGenresWidget(GenreResponse data) {
    final List<Genre> genres = data.genres;

    if (genres.length == 0) {
      return Container(
        child: Text('No Genre'),
      );
    } else
      return GenresList(genres: genres);
  }
}
