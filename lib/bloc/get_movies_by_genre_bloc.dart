import 'package:flutterblocapp/models/movie_response.dart';
import 'package:flutterblocapp/repository/repository.dart';
import 'package:rxdart/rxdart.dart';

class MoviesListByGenreBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<MovieResponse> _subject = BehaviorSubject();

  getMoviesByGenre(int id) async {
    MovieResponse response = await _repository.getMovieByGenre(id);
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<MovieResponse> get subjet => _subject;
}

final moviesByGenreBloc = MoviesListByGenreBloc();
