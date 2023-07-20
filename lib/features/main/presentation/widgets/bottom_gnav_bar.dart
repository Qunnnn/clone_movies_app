import 'package:clone_movies_app/features/main/presentation/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:sizer/sizer.dart';

class BottomGNavBar extends StatelessWidget {
  const BottomGNavBar({
    super.key,
  });

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
          tabs: [
            GButton(
              icon: FontAwesomeIcons.house,
              text: 'Home',
              onPressed: () {
                BlocProvider.of<MainPageBloc>(context)
                    .add(MainPageEvent(index: 0));
              },
            ),
            GButton(
              icon: FontAwesomeIcons.heart,
              text: 'like',
              onPressed: () {
                BlocProvider.of<MainPageBloc>(context)
                    .add(MainPageEvent(index: 1));
              },
            ),
            GButton(
              icon: FontAwesomeIcons.magnifyingGlass,
              text: 'Search',
              onPressed: () {
                BlocProvider.of<MainPageBloc>(context)
                    .add(MainPageEvent(index: 2));
              },
            ),
            GButton(
              icon: FontAwesomeIcons.person,
              text: 'Profile',
              onPressed: () {
                BlocProvider.of<MainPageBloc>(context)
                    .add(MainPageEvent(index: 3));
              },
            ),
          ]),
    );
  }
}
