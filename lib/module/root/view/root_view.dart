import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spotify_ui_clone/core.dart';
import 'package:spotify_ui_clone/utils/color_lib.dart';

class RootView extends StatefulWidget {
  const RootView({Key? key}) : super(key: key);

  Widget build(context, RootController controller) {
    controller.view = this;
    List<StatefulWidget> pages = const [HomeView()];

    return Scaffold(
      body: pages[controller.currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: ColorLib.white,
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.transparent, Color.fromRGBO(0, 0, 0, 1)],
          ),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          fixedColor: Colors.transparent,
          selectedLabelStyle: GoogleFonts.roboto(color: ColorLib.white),
          unselectedLabelStyle: GoogleFonts.roboto(color: ColorLib.label),
          currentIndex: controller.currentIndex,
          onTap: (value) {},
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: Image.asset('assets/buttons/bottom_navbar/home.png'),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Image.asset('assets/buttons/bottom_navbar/search.png'),
                label: 'Search'),
            BottomNavigationBarItem(
                icon: Image.asset(
                    'assets/buttons/bottom_navbar/your_library.png'),
                label: 'Your library'),
            BottomNavigationBarItem(
                icon: Image.asset('assets/buttons/bottom_navbar/premium.png'),
                label: 'Premium'),
          ],
        ),
      ),
    );
  }

  @override
  State<RootView> createState() => RootController();
}
