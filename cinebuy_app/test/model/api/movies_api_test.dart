import 'package:cinebuy_app/model/api/movies_api.dart';
import 'package:cinebuy_app/model/movies_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'movies_api_test.mocks.dart';

@GenerateMocks([MoviesApi])
void main() {
  group('MovieApi', () {
    MoviesApi moviesApi = MockMoviesApi();
    test('Get all latest movies returns data ', () async {
      when(moviesApi.fetchLatestMovies()).thenAnswer(
        (_) async => <MovieModel>[
          MovieModel(
              adult: false,
              backdropPath: '',
              genreIds: [3, 5],
              id: 1,
              mediaType: '',
              originalLanguage: 'en',
              originalTitle: 'Avenger New Type',
              overview: 'This is new movie about avenger',
              popularity: 56.35,
              posterPath: '',
              releaseDate: '20-40-2029',
              title: 'Avenger New Move',
              video: false,
              voteAverage: 4.5,
              voteCount: 30),
        ],
      );
      var movie = await moviesApi.fetchLatestMovies();
      expect(movie.isNotEmpty, true);
    });

    test('Get all trending movies return data', () async {
      when(moviesApi.fetchTrendingMovies()).thenAnswer(
        (_) async => <MovieModel>[
          MovieModel(
              adult: false,
              backdropPath: '',
              genreIds: [3, 5],
              id: 1,
              mediaType: '',
              originalLanguage: 'en',
              originalTitle: 'Avenger New Type',
              overview: 'This is new movie about avenger',
              popularity: 56.35,
              posterPath: '',
              releaseDate: '20-40-2029',
              title: 'Avenger New Move',
              video: false,
              voteAverage: 4.5,
              voteCount: 30),
        ],
      );
      var movies = await moviesApi.fetchTrendingMovies();
      expect(movies.isNotEmpty, true);
    });

    test('Get searched movies reeturn data', () async {
      when(moviesApi.fetchSearchMovies('avengers')).thenAnswer(
        (_) async => <MovieModel>[
          MovieModel(
              adult: false,
              backdropPath: '',
              genreIds: [3, 5],
              id: 1,
              mediaType: '',
              originalLanguage: 'en',
              originalTitle: 'Avenger New Type',
              overview: 'This is new movie about avenger',
              popularity: 56.35,
              posterPath: '',
              releaseDate: '20-40-2029',
              title: 'Avenger New Move',
              video: false,
              voteAverage: 4.5,
              voteCount: 30),
        ],
      );
      var movies = await moviesApi.fetchSearchMovies('avengers');
      expect(movies.isNotEmpty, true);
    });
  });
}
