import 'package:cinebuy_app/model/owned_movies_model.dart';
import 'package:cinebuy_app/model/service/firestore_service.dart';
import 'package:cinebuy_app/utils/state/finite_state.dart';
import 'package:flutter/material.dart';

class BuyFilmProvider extends ChangeNotifier {
  MyState myState = MyState.initial;

  final FirestoreService firestoreService = FirestoreService();
  bool isSaved = false;

  Future<void> saveMovies({required OwnedMovieModel ownedMovieModel}) async {
    myState = MyState.initial;
    notifyListeners();
    try {
      myState = MyState.loading;
      notifyListeners();

      isSaved = await firestoreService.saveMovie(ownedMovieModel);

      myState = MyState.loaded;
      notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
      myState = MyState.failed;
      notifyListeners();
    }
  }
}
