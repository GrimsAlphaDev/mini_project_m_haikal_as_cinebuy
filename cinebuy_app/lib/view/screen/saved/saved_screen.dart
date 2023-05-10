import 'dart:async';

import 'package:cinebuy_app/model/service/auth_service.dart';
import 'package:cinebuy_app/utils/constant/colors.dart';
import 'package:cinebuy_app/utils/formatting/date_format.dart';
import 'package:cinebuy_app/utils/state/finite_state.dart';
import 'package:cinebuy_app/utils/widget/confirm_delete_alert.dart';
import 'package:cinebuy_app/utils/widget/confirm_logout_alert.dart';
import 'package:cinebuy_app/view/screen/home/home_screen.dart';
import 'package:cinebuy_app/view/screen/saved/saved_view_model.dart';
import 'package:cinebuy_app/view/screen/search/search_screen.dart';
import 'package:cinebuy_app/view/screen/stream/stream_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SavedScreen extends StatefulWidget {
  static const String routeName = '/saved';

  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      final authService = Provider.of<AuthService>(context, listen: false);
      authService.getUserLoggegIn();
      final provider = Provider.of<SavedViewModel>(context, listen: false);
      provider.getMovies(authService.email);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Cinebuy'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: PopupMenuButton(
              icon: const Icon(Icons.account_circle),
              itemBuilder: (BuildContext context) {
                return [
                  const PopupMenuItem(
                    value: 'logout',
                    child: Text('Logout'),
                  ),
                ];
              },
              onSelected: (String value) {
                // Handle menu item selection
                if (value == 'logout') {
                  confirmLogout(context, authService);
                }
              },
              offset: const Offset(0, 40),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  Text(
                    'Saved Movie',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '.',
                    style: TextStyle(
                        fontSize: 24,
                        color: primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: Consumer<SavedViewModel>(
                  builder: (context, provider, _) {
                    switch (provider.myState) {
                      case MyState.initial:
                        return const Center(
                          child: Text('No Data Found'),
                        );
                      case MyState.loading:
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      case MyState.loaded:
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Owned Movies (${provider.movies.length})',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 20),
                            ListView.builder(
                              itemCount: provider.movies.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(
                                        builder: (context) {
                                          return StreamScreen(
                                            title:
                                                '${provider.movies[index].title} trailer',
                                          );
                                        },
                                      ));
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        color: secondaryColor.withOpacity(0.5),
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.3),
                                            spreadRadius: 2,
                                            blurRadius: 5,
                                            offset: const Offset(0, 3),
                                          ),
                                        ],
                                      ),
                                      padding: const EdgeInsets.only(bottom: 5),
                                      child: ListTile(
                                        leading: Image.network(
                                          'https://image.tmdb.org/t/p/w500${provider.movies[index].posterPath}',
                                        ),
                                        title: Text(
                                          provider.movies[index].title,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        subtitle: Text(
                                          'Released : ${formatDate(
                                            date: provider
                                                .movies[index].releaseDate,
                                          )}',
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                        trailing: IconButton(
                                          onPressed: () {
                                            confirmDelete(
                                                context,
                                                provider
                                                    .movies[index].ownedMovieId,
                                                provider
                                                    .movies[index].userEmail!,
                                                provider.movies[index].title);
                                          },
                                          icon: const Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        );

                      default:
                        return const SizedBox();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, HomeScreen.routeName);
              },
              child: Column(
                children: const [
                  Icon(Icons.home),
                  Text('Home'),
                ],
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, SearchScreen.routeName);
              },
              child: Column(
                children: const [
                  Icon(Icons.search),
                  Text('Search'),
                ],
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () {},
              child: Column(
                children: const [
                  Icon(Icons.bookmark_border, color: primaryColor),
                  Text('Saved'),
                ],
              ),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
