import 'package:flutterblocapp/models/movie_response.dart';
import 'package:flutterblocapp/repository/repository.dart';
import 'package:rxdart/rxdart.dart';

class MoviesListBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<MovieResponse> _subject = BehaviorSubject();

  getMovies() async {
    MovieResponse response = await _repository.getMovies();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<MovieResponse> get subjet => _subject;
}

final moviesBloc = MoviesListBloc();