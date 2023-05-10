import 'package:cinebuy_app/model/movies_model.dart';
import 'package:cinebuy_app/model/owned_movies_model.dart';
import 'package:cinebuy_app/model/service/auth_service.dart';
import 'package:cinebuy_app/provider/buy_movie_profider.dart';
import 'package:cinebuy_app/utils/constant/colors.dart';
import 'package:cinebuy_app/utils/formatting/date_format.dart';
import 'package:cinebuy_app/view/screen/saved/saved_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/quickalert.dart';
import 'package:uuid/uuid.dart';

Future<void> detailAlertDialog(
  BuildContext context,
  MovieModel movies,
) async {
  final authService = Provider.of<AuthService>(context, listen: false);
  final String email = authService.getUserLoggegIn();
  const uuid = Uuid();
  final provider = Provider.of<BuyMovieProvider>(context, listen: false);
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Movie Detail'),
        content: SingleChildScrollView(
          child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://image.tmdb.org/t/p/w500${movies.posterPath}'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            movies.title ?? '',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          width: 100,
                          height: 25,
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                            child: Text(
                              'Rp. 35.000,-',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Rating : ${movies.voteAverage?.toStringAsFixed(2)} / 10',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          movies.overview ?? '',
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        Text(
                          'Released : ${formatDate(date: movies.releaseDate ?? '')}',
                          style: const TextStyle(
                            fontSize: 14,
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 15),
                        GestureDetector(
                          onTap: () async {
                            await provider.saveMovies(
                              ownedMovieModel: OwnedMovieModel(
                                  ownedMovieId: uuid.v4(),
                                  movieId: movies.id!,
                                  title: movies.title!,
                                  voteAverage: movies.voteAverage!,
                                  releaseDate: movies.releaseDate!,
                                  posterPath:
                                      'https://image.tmdb.org/t/p/w500${movies.posterPath}',
                                  userEmail: email,
                                  overview: movies.overview!),
                            );
                            if (context.mounted) {
                              if (provider.isSaved) {
                                Navigator.of(context).pop();
                                Navigator.of(context)
                                    .pushNamed(SavedScreen.routeName);
                                QuickAlert.show(
                                  context: context,
                                  type: QuickAlertType.success,
                                  title: 'Berhasil Membeli Film',
                                );
                              } else {
                                QuickAlert.show(
                                  context: context,
                                  type: QuickAlertType.error,
                                  title: 'Gagal Membeli Film',
                                  text:
                                      'Film yang anda pilih sudah anda beli sebelumnya',
                                );
                              }
                            }
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Center(
                              child: Text(
                                'BELI FILM',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Close'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
