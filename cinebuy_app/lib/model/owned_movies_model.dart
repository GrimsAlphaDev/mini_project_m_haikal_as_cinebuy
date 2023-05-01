class OwnedMovieModel {
  String ownedMovieId;
  int movieId;
  String title;
  double? voteAverage;
  String releaseDate;
  String posterPath;
  String? userEmail;

  OwnedMovieModel({
    required this.ownedMovieId,
    required this.movieId,
    required this.title,
    required this.voteAverage,
    required this.releaseDate,
    required this.posterPath,
    required this.userEmail,
  });

  Map<String, dynamic> createMap() {
    return {
      'ownedMovieId': ownedMovieId,
      'movieId': movieId,
      'title': title,
      'voteAverage': voteAverage,
      'releaseDate': releaseDate,
      'posterPath': posterPath,
      'userEmail': userEmail,
    };
  }

  OwnedMovieModel.fromFirestore(Map<String, dynamic> map)
      : ownedMovieId = map['ownedMovieId'],
        movieId = map['movieId'],
        title = map['title'],
        voteAverage = map['voteAverage'],
        releaseDate = map['releaseDate'],
        posterPath = map['posterPath'],
        userEmail = map['userEmail'];

  /// Simbol : dalam kode yang diatas digunakan untuk mendefinisikan sebuah konstruktor di Dart dengan parameter nama. Itu disebut daftar inisialisasi konstruktor.
  /// Dalam contoh kode tersebut, konstruktor adalah OwnedMovie.fromFirestore dan memerlukan argumen Map<String, dynamic> bernama map. Kode setelah simbol : digunakan untuk menginisialisasi properti dari objek OwnedMovie yang sedang dibangun dari parameter map.
}
