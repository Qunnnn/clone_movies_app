import 'package:clone_movies_app/features/favorites/presentation/pages/fav_page.dart';
import 'package:clone_movies_app/features/home/presentation/pages/home_page.dart';
import 'package:clone_movies_app/features/main/presentation/bloc/bloc.dart';
import 'package:clone_movies_app/features/profile/presentation/pages/profile_page.dart';
import 'package:clone_movies_app/features/search/presentation/pages/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/widgets.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});
  List<Widget> pageList = [
    const HomePage(),
    const FavPage(),
    const SearchPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black12,
        bottomNavigationBar: const BottomGNavBar(),
        body: BlocBuilder<MainPageBloc, MainState>(
          builder: (context, state) {
            MainPageState pageState = state as MainPageState;
            return pageList[pageState.mainPage];
          },
        ));
  }
}
