import 'package:cinebuy_app/model/api/movies_api.dart';
import 'package:cinebuy_app/model/movies_model.dart';
import 'package:cinebuy_app/utils/state/finite_state.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class HomeViewModel with ChangeNotifier {
  MyState myState = MyState.initial;

  final MoviesApi service = MoviesApi();

  List<MovieModel> movies = [];
  List<MovieModel> latestMovies = [];

  Future<void> getTrendingMovies() async {
    myState = MyState.initial;
    notifyListeners();
    try {
      myState = MyState.loading;
      notifyListeners();

      movies = await service.fetchTrendingMovies();

      myState = MyState.loaded;
      notifyListeners();
    } catch (e) {
      if (e is DioError) {
        e.response!.statusCode;
      }
      myState = MyState.failed;
      notifyListeners();
    }
  }

  Future<void> getLatestMovies() async {
    myState = MyState.initial;
    notifyListeners();
    try {
      myState = MyState.loading;
      notifyListeners();

      latestMovies = await service.fetchLatestMovies();

      myState = MyState.loaded;
      notifyListeners();
    } catch (e) {
      if (e is DioError) {
        e.response!.statusCode;
      }
      myState = MyState.failed;
      notifyListeners();
    }
  }
}
