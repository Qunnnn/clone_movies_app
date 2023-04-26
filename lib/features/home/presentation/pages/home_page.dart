import '../widgets/my_bottom_navbar.dart';
import '../widgets/my_popular_tv_widget.dart';
import '../widgets/my_top_rated_movie_widget.dart';
import '../widgets/my_trending_movie_widget.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../widgets/welcome.dart';

class HomePage extends StatefulWidget {
  String welcomeImage;
  HomePage({super.key, required this.welcomeImage});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const MyNavBar(),
      backgroundColor: Colors.black12,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xff2A2F4F),
                  Color(0xff393646),
                  Color(0xff393646),
                  Color(0xff7B8FA1),
                ],
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 20.h,
                  width: double.infinity,
                  child: Welcome(welcomImage: widget.welcomeImage),
                ),
                const TrendingMovie(),
                const TopRatedMovie(),
                const PopularTv(),
                SizedBox(
                  height: 5.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
