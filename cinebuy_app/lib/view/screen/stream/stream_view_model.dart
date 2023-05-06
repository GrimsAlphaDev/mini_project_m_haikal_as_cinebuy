import 'package:cinebuy_app/utils/state/finite_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class StreamViewModel with ChangeNotifier {
  MyState myState = MyState.initial;
  final yt = YoutubeExplode();
  String videoUrl = '';
  dynamic videoId;

  get title => null;

  void getStreamMovies(String query) async {
    myState = MyState.initial;
    notifyListeners();
    try {
      myState = MyState.loading;
      notifyListeners();

      /// This line gets the search client from the YoutubeExplode instance. The search client provides methods for searching for videos, playlists, and channels.
      final searchClient = yt.search;

      /// This line calls the search method on the searchClient instance to search for videos with the given videoTitle. The await keyword is used to wait for the search results to be returned before continuing with the function.
      final searchResult = await searchClient.search(query);

      /// This line gets the first video from the search results returned by the search method. The searchResult variable is an iterable, so we can use the first property to get the first item in the list.
      final firstVideo = searchResult.first;

      videoUrl = firstVideo.url;
      videoId = YoutubePlayer.convertUrlToId(videoUrl);

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
