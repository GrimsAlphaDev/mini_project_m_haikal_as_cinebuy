import 'package:cinebuy_app/model/owned_movies_model.dart';
import 'package:cinebuy_app/model/service/firestore_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'firestore_service_test.mocks.dart';

@GenerateMocks([FirestoreService])
void main() {
  group('FirestoreService', () {
    FirestoreService firestoreService = MockFirestoreService();

    test('Confirm Movie Exist return data', () async {
      OwnedMovieModel movieModel = OwnedMovieModel(
        ownedMovieId: '1001',
        movieId: 203,
        title: 'Transformer',
        voteAverage: 40.50,
        releaseDate: '15-06-2019',
        posterPath: '',
        userEmail: 'user1@gmail.com',
        overview: 'This Movie Is About Transformer',
      );
      when(firestoreService.doesMovieExist(movieModel))
          .thenAnswer((_) async => true);
      bool movie = await firestoreService.doesMovieExist(movieModel);
      expect(movie, true);
    });

    test('Get Movie By User Return Data', () async {
      when(firestoreService.getMoviesByUser('user1@gmail.com'))
          .thenAnswer((_) async => <OwnedMovieModel>[
                OwnedMovieModel(
                  ownedMovieId: '1001',
                  movieId: 203,
                  title: 'Transformer',
                  voteAverage: 40.50,
                  releaseDate: '15-06-2019',
                  posterPath: '',
                  userEmail: 'user1@gmail.com',
                  overview: 'This Movie Is About Transformer',
                ),
              ]);
      List<OwnedMovieModel> movies =
          await firestoreService.getMoviesByUser('user1@gmail.com');
      expect(movies.isNotEmpty, true);
    });
  });
}
