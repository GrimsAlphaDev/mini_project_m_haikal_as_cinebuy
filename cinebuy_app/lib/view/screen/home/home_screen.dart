import 'package:cinebuy_app/model/service/auth_service.dart';
import 'package:cinebuy_app/utils/constant/colors.dart';
import 'package:cinebuy_app/utils/state/finite_state.dart';
import 'package:cinebuy_app/utils/widget/confirm_logout_alert.dart';
import 'package:cinebuy_app/utils/widget/detail_movies_alert.dart';
import 'package:cinebuy_app/view/screen/home/home_view_model.dart';
import 'package:cinebuy_app/view/screen/saved/saved_screen.dart';
import 'package:cinebuy_app/view/screen/search/search_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      final provider = Provider.of<HomeViewModel>(context, listen: false);
      provider.getTrendingMovies();
      provider.getLatestMovies();
    });
  }

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Cinebuy'),
        actions: [
          IconButton(
            onPressed: () {
              confirmLogout(context, authService);
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Trending',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 300,
                child: Consumer<HomeViewModel>(builder: (context, provider, _) {
                  switch (provider.myState) {
                    case MyState.initial:
                      return const Center(
                        child: Text('No Data Found'),
                      );
                    case MyState.loading:
                      return const Center(child: CircularProgressIndicator());
                    case MyState.loaded:
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: provider.movies.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: GestureDetector(
                              onTap: () {
                                detailAlertDialog(
                                    context, provider.movies[index]);
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 300,
                                    height: 200,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            'https://image.tmdb.org/t/p/original/${provider.movies[index].posterPath}'),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    '${provider.movies[index].title}',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    'Rating : ${provider.movies[index].voteAverage?.toStringAsFixed(2)}',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    default:
                      return const Center(child: CircularProgressIndicator());
                  }
                }),
              ),
              Row(
                children: const [
                  Text(
                    'Latest',
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
              // vertical list
              SizedBox(
                width: double.infinity,
                child: Consumer<HomeViewModel>(
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
                        return ListView.builder(
                          itemCount: provider.latestMovies.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: GestureDetector(
                                onTap: () {
                                  detailAlertDialog(
                                      context, provider.latestMovies[index]);
                                },
                                child: Row(
                                  children: [
                                    Container(
                                      width: 150,
                                      height: 200,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              'https://image.tmdb.org/t/p/original/${provider.latestMovies[index].posterPath}'),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    SizedBox(
                                      width: 200,
                                      height: 200,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${provider.latestMovies[index].title}',
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            'Rating : ${provider.latestMovies[index].voteAverage?.toStringAsFixed(2)}',
                                            style: const TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            '${provider.latestMovies[index].overview}',
                                            maxLines: 5,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );

                      default:
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
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
          const BottomNavigationBarItem(
            icon: Icon(Icons.home, color: primaryColor),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, SearchScreen.routeName);
              },
              child: const Icon(
                Icons.search,
              ),
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, SavedScreen.routeName);
              },
              child: const Icon(
                Icons.bookmark_border,
              ),
            ),
            label: 'Saved',
          ),
        ],
      ),
    );
  }

  
}
