import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spotify_ui_clone/core.dart';
import 'package:spotify_ui_clone/utils/color_lib.dart';
import '../controller/playing_controller.dart';

class PlayingView extends StatefulWidget {
  const PlayingView({Key? key}) : super(key: key);
  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return [
      if (duration.inHours > 0) hours,
      minutes,
      seconds,
    ].join(':');
  }

  Widget build(context, PlayingController controller) {
    controller.view = this;
    // wraping scaffold with container to give the gradient background
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [ColorLib.bodyText, ColorLib.black])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          // setting appbar background color to transparent to allow the gradient color
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0.0,
          automaticallyImplyLeading: false,
          leading: Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
                onPressed: () {},
                icon: Image.asset(
                  'assets/buttons/icons/down.png',
                  width: 24,
                  height: 24,
                )),
          ),
          title: Column(
            children: [
              Text(
                'PLAYING FROM ALBUM',
                style: GoogleFonts.roboto(
                    color: ColorLib.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w400),
              ),
              Text(
                'Dangerous',
                style: GoogleFonts.roboto(
                    color: ColorLib.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w700),
              )
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.more_vert,
                  size: 24.0,
                  color: ColorLib.white,
                ),
              ),
            )
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            const SizedBox(height: 30),
            Image.asset(
              'assets/album_covers/dangerous_big.png',
              fit: BoxFit.cover,
              width: 343,
              height: 343,
            ),
            const SizedBox(height: 30),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Heal The World',
                          style: GoogleFonts.roboto(
                              color: ColorLib.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          'Michael Jackson',
                          style: GoogleFonts.roboto(
                              color: ColorLib.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        controller.updateFavorite();
                      },
                      icon: Icon(
                        Icons.favorite,
                        size: 24,
                        color: controller.isFavorite
                            ? ColorLib.greenButton
                            : ColorLib.white,
                      ),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(height: 16),
            Column(
              children: [
                Slider(
                    activeColor: ColorLib.white,
                    inactiveColor: ColorLib.trackLine,
                    min: 0,
                    max: controller.duration.inSeconds.toDouble(),
                    value: controller.position.inSeconds.toDouble(),
                    onChanged: (value) async {
                      controller.position = Duration(seconds: value.toInt());
                      await controller.audioPlayer.seek(controller.position);
                      await controller.audioPlayer.resume();
                    }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      formatTime(controller.position),
                      style: GoogleFonts.roboto(
                          color: ColorLib.bodyText,
                          fontSize: 10,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(formatTime(controller.duration - controller.position),
                        style: GoogleFonts.roboto(
                            color: ColorLib.bodyText,
                            fontSize: 10,
                            fontWeight: FontWeight.w500))
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 56,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset('assets/buttons/playing/shuffle.png'),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset('assets/buttons/playing/previous.png'),
                  ),
                  IconButton(
                    onPressed: () {
                      controller.playAudio();
                    },
                    icon: controller.isPlaying
                        ? Container(
                            width: 56,
                            height: 56,
                            decoration: BoxDecoration(
                                color: ColorLib.white, shape: BoxShape.circle),
                            child: Icon(
                              Icons.pause,
                              color: ColorLib.black,
                              size: 28,
                            ),
                          )
                        : Container(
                            width: 56,
                            height: 56,
                            decoration: BoxDecoration(
                                color: ColorLib.white, shape: BoxShape.circle),
                            child: Icon(
                              Icons.play_arrow,
                              color: ColorLib.black,
                              size: 28,
                            ),
                          ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset('assets/buttons/playing/next.png'),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset('assets/buttons/playing/repeat.png'),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Image.asset('assets/buttons/playing/device.png')),
                const SizedBox(
                  width: 200,
                ),
                IconButton(
                    onPressed: () {},
                    icon: Image.asset('assets/buttons/playing/share.png')),
                IconButton(
                    onPressed: () {},
                    icon: Image.asset('assets/buttons/playing/queue.png')),
              ],
            ),
            Image.asset('assets/lyric/lyric_card.png')
          ],
        ),
      ),
    );
  }

  @override
  State<PlayingView> createState() => PlayingController();
}
