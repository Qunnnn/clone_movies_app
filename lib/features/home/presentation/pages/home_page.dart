import 'package:clone_movies_app/features/home/home.dart';
import 'package:clone_movies_app/features/home/presentation/widgets/my_upcoming_movie_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    BlocProvider.of<TopRatedMovieBloc>(context).add(LoadTopRatedMovie());
    BlocProvider.of<PopularTvBloc>(context).add(LoadPopularTvEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: const Welcome(),
      drawer: const MyDrawer(),
      body: Container(
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
        child: Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const UpcomingMovie(),
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
