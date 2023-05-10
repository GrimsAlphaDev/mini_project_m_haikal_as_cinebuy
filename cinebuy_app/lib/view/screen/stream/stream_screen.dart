import 'package:cinebuy_app/utils/state/finite_state.dart';
import 'package:cinebuy_app/view/screen/stream/stream_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class StreamScreen extends StatefulWidget {
  static const String routeName = '/stream_movie';

  final String title;

  const StreamScreen({super.key, required this.title});

  @override
  State<StreamScreen> createState() => _StreamScreenState();
}

class _StreamScreenState extends State<StreamScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      final provider = Provider.of<StreamViewModel>(context, listen: false);
      provider.getStreamMovies(widget.title);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<StreamViewModel>(context);
    YoutubePlayerController controller = YoutubePlayerController(
      initialVideoId: provider.videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
    return Scaffold(
      body: Consumer<StreamViewModel>(
        builder: (context, provider, _) {
          switch (provider.myState) {
            case MyState.initial:
              return const Center(
                child: Text('No Movies Found'),
              );
            case MyState.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case MyState.loaded:
              return SafeArea(
                child: YoutubePlayerBuilder(
                  player: YoutubePlayer(controller: controller),
                  builder: (context, player) {
                    return Column(
                      children: [
                        // some other widgets or UI elements
                        Expanded(
                          child: player,
                        ),
                      ],
                    );
                  },
                ),
              );

            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
