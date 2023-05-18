import 'package:flutter/material.dart';
import 'package:spotify_ui_clone/core.dart';
import 'package:spotify_ui_clone/utils/color_lib.dart';

class RootView extends StatefulWidget {
  const RootView({Key? key}) : super(key: key);

  Widget build(context, RootController controller) {
    controller.view = this;
    List<StatefulWidget> pages = const [HomeView()];

    return Scaffold(
      // extendedBody is set to true to make  bottomNavigationBar transparent
      extendBody: true,
      body: pages[controller.currentIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color.fromRGBO(0, 0, 0, 0.75), Color.fromRGBO(0, 0, 0, 1)],
          ),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          selectedItemColor: ColorLib.white,
          unselectedItemColor: ColorLib.label,
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
