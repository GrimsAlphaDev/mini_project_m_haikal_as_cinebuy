import 'package:cinebuy_app/model/owned_movies_model.dart';
import 'package:cinebuy_app/model/service/firestore_service.dart';
import 'package:cinebuy_app/utils/state/finite_state.dart';
import 'package:flutter/material.dart';

class SavedViewModel with ChangeNotifier {
  MyState myState = MyState.initial;

  final FirestoreService service = FirestoreService();

  late List<OwnedMovieModel> movies;

  void getMovies(String email) async {
    myState = MyState.initial;
    notifyListeners();
    try {
      myState = MyState.loading;
      notifyListeners();

      movies = await service.getMoviesByUser(email);

      myState = MyState.loaded;
      notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
      myState = MyState.failed;
      notifyListeners();
    }
  }
}
