import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:spotify_ui_clone/state_util.dart';
import '../view/playing_view.dart';

class PlayingController extends State<PlayingView> implements MvcController {
  static late PlayingController instance;
  late PlayingView view;

  @override
  void initState() {
    instance = this;
    super.initState();

    audioPlayer.onPlayerStateChanged.listen(
      (event) {
        setState(() {
          isPlaying = event == PlayerState.playing;
        });
      },
    );
    audioPlayer.onDurationChanged.listen(
      (newDuration) {
        setState(() {
          duration = newDuration;
        });
      },
    );
    audioPlayer.onPositionChanged.listen(
      (newPosition) {
        position = newPosition;
      },
    );
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);
  bool isFavorite = false;
  void updateFavorite() {
    isFavorite = !isFavorite;
    setState(() {});
  }

  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  void playAudio() async {
    if (isPlaying) {
      await audioPlayer.pause();
    } else {
      await audioPlayer.setSource(AssetSource('music/heal_the_world.mp3'));
      await audioPlayer.setVolume(80);
      await audioPlayer.resume();
      isPlaying = true;
      setState(() {});
    }
  }
}
