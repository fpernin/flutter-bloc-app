import 'package:dio/dio.dart';
import 'package:flutterblocapp/models/cast_response.dart';
import 'package:flutterblocapp/models/genre_response.dart';
import 'package:flutterblocapp/models/movie_detail_response.dart';
import 'package:flutterblocapp/models/movie_response.dart';
import 'package:flutterblocapp/models/person_response.dart';
import 'package:flutterblocapp/models/video_response.dart';

class MovieRepository {
  final String apiKey = "";
  static String url = "https://api.themoviedb.org/3";
  final Dio _dio = Dio();

  String getPopularUrl = "$url/movie/top_rated";
  String getMoviesUrl = "$url/discover/movie";
  String getPlayingUrl = "$url/movie/now_playing";
  String getGenresUrl = "$url/genre/movie/list";
  String getPersonsUrl = "$url/trending/person/week";
  String getMovieUrl = "$url/movie";

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
      Response response = await _dio.get(getMoviesUrl, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return MovieResponse.withError("$error");
    }
  }

  Future<MovieDetailResponse> getMovieDetail(int id) async {
    var params = {"api_key": apiKey, "language": "fr-FR"};

    try {
      Response response =
          await _dio.get(getMovieUrl + "/$id", queryParameters: params);
      return MovieDetailResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return MovieDetailResponse.withError("$error");
    }
  }

  Future<CastResponse> getCasts(int id) async {
    var params = {"api_key": apiKey, "language": "fr-FR"};

    try {
      Response response = await _dio.get(getMovieUrl + "/$id" + "/credits",
          queryParameters: params);
      return CastResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return CastResponse.withError("$error");
    }
  }

  Future<MovieResponse> getSimilarMovies(int id) async {
    var params = {"api_key": apiKey, "language": "fr-FR"};

    try {
      Response response = await _dio.get(getMovieUrl + "/$id" + "/similar",
          queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return MovieResponse.withError("$error");
    }
  }

  Future<VideoResponse> getMovieVideos(int id) async {
    var params = {"api_key": apiKey, "language": "fr-FR"};

    try {
      Response response = await _dio.get(getMovieUrl + "/$id" + "/videos",
          queryParameters: params);
      return VideoResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return VideoResponse.withError("$error");
    }
  }
}
