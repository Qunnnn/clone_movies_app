import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:sizer/sizer.dart';

class MyNavBar extends StatelessWidget {
  const MyNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 8.h,
      child: GNav(
          gap: 10,
          backgroundColor: Colors.black45,
          color: Colors.white,
          activeColor: Colors.white,
          rippleColor: Colors.grey,
          tabActiveBorder: Border.all(color: Colors.white38),
          tabBackgroundColor: Colors.grey.shade900,
          tabBorderRadius: 50,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          padding: const EdgeInsets.all(10),
          tabs: const [
            GButton(
              icon: FontAwesomeIcons.house,
              text: 'Home',
            ),
            GButton(
              icon: FontAwesomeIcons.heart,
              text: 'like',
            ),
            GButton(
              icon: FontAwesomeIcons.magnifyingGlass,
              text: 'Search',
            ),
            GButton(
              icon: FontAwesomeIcons.person,
              text: 'Profile',
            ),
          ]),
    );
  }
}
