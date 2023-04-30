import 'package:cinebuy_app/model/movies_model.dart';
import 'package:cinebuy_app/utils/constant/api_key.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

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
      debugPrint(e.toString());
      rethrow;
    }
  }

  Future fetchLatestMovies() async {
    try {
      final Response response = await dio.get(
        'https://api.themoviedb.org/3/movie/now_playing?api_key=$apiKey',
      );

      debugPrint(response.data['results'].toString());

      latestMovies = (response.data['results'] as List)
          .map((item) => MovieModel.fromJson(item))
          .toList();

      return latestMovies;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
