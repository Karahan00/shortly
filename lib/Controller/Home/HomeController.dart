import 'package:flutter/material.dart';
import 'package:shortly/Controller/Library/LibraryController.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:shortly/Utils/Interface/CustomColors.dart';
import 'package:shortly/Utils/Interface/Labels.dart';

import '../Shorter/ShorterController.dart';

class HomeController extends StatefulWidget {
  const HomeController({super.key});

  @override
  State<HomeController> createState() => _HomeControllerState();
}

class _HomeControllerState extends State<HomeController> {

  // Current Index of the navigation
  int currentIndexForBottomNavigation = 0;

  // Defined screens
  static const _screens = [
    ShorterController(),
    LibraryController()
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 4.0,
              spreadRadius: 3.0,
              offset: const Offset(0, 2), // controls the position of the shadow
            ),
          ],
        ),
        child: BubbleBottomBar(
          hasNotch: true,
          hasInk: true,
          //fabLocation: BubbleBottomBarFabLocation.end,
          opacity: 0.45,
          currentIndex: currentIndexForBottomNavigation,
          onTap: _changePage,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(16),
          ), //border radius doesn't work when the notch is enabled.
          elevation: 8,
          tilesPadding: const EdgeInsets.symmetric(
            vertical: 8.0,
          ),
          items: <BubbleBottomBarItem>[
            BubbleBottomBarItem(
              showBadge: false,
              badgeColor: CustomColors.fireEngineRed,
              backgroundColor: CustomColors.silver,
              icon: const Icon(
                Icons.home_outlined,
                color: CustomColors.silver,
                size: 30.0,
              ),
              activeIcon: const Icon(
                Icons.home,
                color: CustomColors.delftBlue,
                size: 30.0,
              ),
              title: Labels.drawBasicLabel(
                "Hauptmenü",
                alignment: TextAlign.center,
                color: CustomColors.delftBlue,
                maxLines: 1,
                optionalFontSize: 13
              ),
            ),
            BubbleBottomBarItem(
              showBadge: false,
              badgeColor: CustomColors.fireEngineRed,
              backgroundColor: CustomColors.silver,
              icon: const Icon(
                Icons.bookmark_border_sharp,
                color: CustomColors.delftBlue,
                size: 30.0,
              ),
              activeIcon: const Icon(
                Icons.bookmark,
                color: CustomColors.delftBlue,
                size: 30.0,
              ),
              title: Labels.drawBasicLabel(
                "Bibliothek",
                alignment: TextAlign.center,
                color: CustomColors.delftBlue,
                maxLines: 1,
                optionalFontSize: 13
              ),
            ),
          ]
        ),
      ),
      body: _screens[currentIndexForBottomNavigation],
    );
  }

  void _changePage(int? index) {
    setState(() {
      currentIndexForBottomNavigation = index!;
    });
  }

}
