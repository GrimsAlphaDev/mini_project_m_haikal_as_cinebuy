import 'package:cinebuy_app/model/owned_movies_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  bool successAddMovie = false;

  Future<void> saveMovie(OwnedMovieModel movie) async {
    final exist = await doesMovieExist(movie);
    if (exist) {
      debugPrint('Movie already exist');
      successAddMovie = false;
    } else {
      debugPrint('Movie does not exist');
      try {
        _db.collection('movies').doc(movie.ownedMovieId).set(movie.createMap());
        successAddMovie = true;
      } catch (e) {
        debugPrint(e.toString());
      }
    }
  }

  Future<bool> doesMovieExist(OwnedMovieModel movie) async {
    final movies = getMovies();

    await for (var movieList in movies) {
      for (var ownedMovie in movieList) {
        if (ownedMovie.movieId == movie.movieId &&
            ownedMovie.userEmail == movie.userEmail) {
          return true;
        }
      }
      return false;
    }
    return false;
  }

  Stream<List<OwnedMovieModel>> getMovies() {
    return _db.collection('movies').snapshots().map((snapshot) => snapshot.docs
        .map((document) => OwnedMovieModel.fromFirestore(document.data()))
        .toList());
  }

  Future<void> removeMovie(String ownedMovieId) {
    return _db.collection('movies').doc(ownedMovieId).delete();
  }

  Future<List<OwnedMovieModel>> getMoviesByUser(String userEmail) async {
    final movies = await _db
        .collection('movies')
        .where('userEmail', isEqualTo: userEmail)
        .get();

    return movies.docs
        .map((document) => OwnedMovieModel.fromFirestore(document.data()))
        .toList();
  }
}
