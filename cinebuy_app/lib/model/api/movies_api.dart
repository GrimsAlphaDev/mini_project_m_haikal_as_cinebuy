import 'package:cinebuy_app/model/movies_model.dart';
import 'package:cinebuy_app/utils/constant/api_key.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class MoviesApi {
  final Dio dio = Dio();

  late List<MovieModel> movies;

  Future fetchTrendingMovies() async {
    try {
      final Response response = await dio.get(
        'https://api.themoviedb.org/3/trending/movie/week?api_key=$apiKey',
      );

      movies = (response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e))
          .toList();

      debugPrint(movies.toString());
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
