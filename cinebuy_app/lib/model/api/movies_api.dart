import 'package:cinebuy_app/model/movies_model.dart';
import 'package:cinebuy_app/utils/constant/api_key.dart';
import 'package:dio/dio.dart';

class MoviesApi {
  final Dio dio = Dio();

  late List<MovieModel> movies;
  late List<MovieModel> latestMovies;

  Future fetchTrendingMovies() async {
    try {
      final Response response = await dio.get(
        'https://api.themoviedb.org/3/trending/movie/week?api_key=$apiKey',
      );

      movies = (response.data['results'] as List)
          .map((item) => MovieModel.fromJson(item))
          .toList();

      return movies;
    } catch (e) {
      rethrow;
    }
  }

  Future fetchLatestMovies() async {
    try {
      final Response response = await dio.get(
        'https://api.themoviedb.org/3/movie/now_playing?api_key=$apiKey',
      );

      latestMovies = (response.data['results'] as List)
          .map((item) => MovieModel.fromJson(item))
          .toList();

      return latestMovies;
    } catch (e) {
      rethrow;
    }
  }

  Future fetchSearchMovies(String query) async {
    try {
      final Response response = await dio.get(
        'https://api.themoviedb.org/3/search/movie?api_key=$apiKey&query=$query',
      );

      movies = (response.data['results'] as List)
          .map((item) => MovieModel.fromJson(item))
          .toList();

      return movies;
    } catch (e) {
      rethrow;
    }
  }
}
