import 'package:dio/dio.dart';
import 'package:flutterblocapp/models/genre_response.dart';
import 'package:flutterblocapp/models/movie_response.dart';
import 'package:flutterblocapp/models/person_response.dart';

class MovieRepository {
  final String apiKey = "";
  static String url = "https://api.themoviedb.org/3";
  final Dio _dio = Dio();

  String getPopularUrl = "$url/movie/top_rated";
  String getMoviesUrl = "$url/discover/movie";
  String getPlayingUrl = "$url/movie/now_playing";
  String getGenresUrl = "$url/genre/movie/list";
  String getPersonsUrl = "$url/trending/person/week";

  Future<MovieResponse> getMovies() async {
    var params = {
      "api_key": apiKey,
      "language": "fr-FR",
      "page": 1,
    };

    try {
      Response response =
          await _dio.get(getPopularUrl, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return MovieResponse.withError("$error");
    }
  }

  Future<MovieResponse> getPlayingMovies() async {
    var params = {
      "api_key": apiKey,
      "language": "fr-FR",
      "page": 1,
    };

    try {
      Response response =
          await _dio.get(getPlayingUrl, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return MovieResponse.withError("$error");
    }
  }

  Future<GenreResponse> getGenres() async {
    var params = {
      "api_key": apiKey,
      "language": "fr-FR",
      "page": 1,
    };

    try {
      Response response = await _dio.get(getGenresUrl, queryParameters: params);
      return GenreResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return GenreResponse.withError("$error");
    }
  }

  Future<PersonResponse> getPersons() async {
    var params = {
      "api_key": apiKey,
      "language": "fr-FR",
      "page": 1,
    };

    try {
      Response response =
          await _dio.get(getPersonsUrl, queryParameters: params);
      return PersonResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return PersonResponse.withError("$error");
    }
  }

  Future<MovieResponse> getMovieByGenre(int id) async {
    var params = {
      "api_key": apiKey,
      "language": "fr-FR",
      "page": 1,
      "with_genres": id,
    };

    try {
      Response response =
          await _dio.get(getPersonsUrl, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return MovieResponse.withError("$error");
    }
  }
}
