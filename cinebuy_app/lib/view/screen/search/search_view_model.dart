import 'package:cinebuy_app/model/api/movies_api.dart';
import 'package:cinebuy_app/model/movies_model.dart';
import 'package:cinebuy_app/utils/state/finite_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class SearchViewModel with ChangeNotifier {
  MyState myState = MyState.initial;

  final MoviesApi service = MoviesApi();

  late List<MovieModel> movies;

  void getSearchMovies(String query) async {
    myState = MyState.initial;
    notifyListeners();
    try {
      myState = MyState.loading;
      notifyListeners();

      movies = await service.fetchSearchMovies(query);

      myState = MyState.loaded;
      notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
      if (e is DioError) {
        e.response!.statusCode;
      }
      myState = MyState.failed;
      notifyListeners();
    }
  }
}
