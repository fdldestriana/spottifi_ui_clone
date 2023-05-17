import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spotify_ui_clone/core.dart';
import 'package:spotify_ui_clone/utils/color_lib.dart';
import '../controller/home_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  Widget build(context, HomeController controller) {
    controller.view = this;
    Map<String, String> albumCovers = {
      "Liked_Songs": "liked_songs.png",
      "Dangerous": "dangerous.png",
      "For_you": "for_you.png",
      "Justin_Bieber": "justin_bieber.png",
      "Midnights": "midnights.png"
    };
    Map<String, String> dailyMix = {
      "daily_mix_1": "Drake, Michael Jackson,\nDua Lipa and more",
      "daily_mix_2": "Justin Bieber, Michael\nJackson, Dua Lipa",
      "daily_mix_3": "The Weeknd, Michael\nJackson, Dua Lipa",
      "daily_mix_4": "Taylor Swift, Michael\nJackson, Dua Lipa",
      "daily_mix_5": "Selena Gomez, Michael\nJackson, Dua Lipa",
    };
    Map<String, String> shows = {
      "show_1": "show_1.png",
      "show_2": "show_2.png",
      "show_3": "show_3.png",
      "show_4": "show_4.png"
    };
    return Scaffold(
      backgroundColor: ColorLib.black,
      appBar: AppBar(
        backgroundColor: ColorLib.black,
        title: Text(
          "Good morning",
          style: GoogleFonts.roboto(
              color: ColorLib.white, fontSize: 24, fontWeight: FontWeight.w700),
        ),
        actions: [
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Image.asset(
                  'assets/buttons/icons/whats_new.png',
                  // color: ColorLib.white,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Image.asset(
                  'assets/buttons/icons/recently_played.png',
                  color: ColorLib.white,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Image.asset(
                  'assets/buttons/icons/setting.png',
                  color: ColorLib.white,
                ),
              )
            ],
          )
        ],
      ),
      body: ListView(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 224,
            margin: const EdgeInsets.only(left: 16, top: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Recently played',
                  style: GoogleFonts.roboto(
                      color: ColorLib.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 4),
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 16),
                    scrollDirection: Axis.horizontal,
                    itemCount: albumCovers.length,
                    itemBuilder: (context, index) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Image.asset(
                            'assets/album_covers/${albumCovers.values.elementAt(index)}',
                            width: 114,
                            height: 114,
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          albumCovers.keys
                              .elementAt(index)
                              .replaceAll('_', ' '),
                          style: GoogleFonts.roboto(
                              color: ColorLib.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 16),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 290,
            margin: const EdgeInsets.only(left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'To get you started',
                  style: GoogleFonts.roboto(
                      color: ColorLib.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w700),
                ),
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 16),
                    scrollDirection: Axis.horizontal,
                    itemCount: dailyMix.length,
                    itemBuilder: (context, index) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Image.asset(
                            'assets/daily_mix/${dailyMix.keys.elementAt(index)}.png',
                            width: 144,
                            height: 144,
                            fit: BoxFit.contain,
                          ),
                        ),
                        Text(
                          dailyMix.values.elementAt(index),
                          style: GoogleFonts.roboto(
                              color: ColorLib.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 16),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 290,
            margin: const EdgeInsets.only(left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your shows',
                  style: GoogleFonts.roboto(
                      color: ColorLib.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w700),
                ),
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 16),
                    scrollDirection: Axis.horizontal,
                    itemCount: shows.length,
                    itemBuilder: (context, index) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Image.asset(
                            'assets/shows/${shows.values.elementAt(index)}',
                            width: 144,
                            height: 144,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  State<HomeView> createState() => HomeController();
}
