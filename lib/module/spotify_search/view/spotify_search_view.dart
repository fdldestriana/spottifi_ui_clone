import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spotify_ui_clone/core.dart';
import 'package:spotify_ui_clone/utils/color_lib.dart';
import '../controller/spotify_search_controller.dart';

class SpotifySearchView extends StatefulWidget {
  const SpotifySearchView({Key? key}) : super(key: key);

  Widget build(context, SpotifySearchController controller) {
    controller.view = this;

    return Scaffold(
      backgroundColor: ColorLib.black,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Text(
            "Search",
            style: GoogleFonts.roboto(
                color: ColorLib.white,
                fontSize: 24,
                fontWeight: FontWeight.w700),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Image.asset('assets/buttons/icons/camera.png'))
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 8),
              Center(
                child: Container(
                  width: 343,
                  height: 48,
                  decoration: BoxDecoration(
                    color: ColorLib.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: TextField(
                    controller: controller.searchController,
                    decoration: InputDecoration(
                      hintText: 'What do you want to listen to?',
                      hintStyle: GoogleFonts.roboto(
                          color: ColorLib.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                      prefix: Padding(
                        padding: const EdgeInsets.only(left: 12, right: 5),
                        child: Image.asset(
                          'assets/buttons/icons/search.png',
                          color: ColorLib.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Browse all',
                  style: GoogleFonts.roboto(
                      color: ColorLib.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                width: MediaQuery.of(context).size.width,
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 3.7 / 1,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      crossAxisCount: 2),
                  itemBuilder: (context, index) =>
                      Container(color: Colors.amber),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<SpotifySearchView> createState() => SpotifySearchController();
}
