import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:clone_movies_app/features/intro/intro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sizer/sizer.dart';
import '../../../../shared/constants/assest_path.dart';

class Welcome extends StatefulWidget implements PreferredSizeWidget {
  const Welcome({
    super.key,
  });

  @override
  State<Welcome> createState() => _WelcomeState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, 25.h);
}

class _WelcomeState extends State<Welcome> {
  @override
  void initState() {
    BlocProvider.of<UpComingMovieBloc>(context).add(FetchMovieEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpComingMovieBloc, UpComingMovieState>(
      builder: (context, state) {
        if (state is Loading) {
          return SpinKitFadingCircle(
            color: Colors.white,
            size: 5.h,
          );
        }
        if (state is LoadedMoviesState) {
          return Stack(children: [
            ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(colors: [
                      Color(0xff012841),
                      Color(0xff012841),
                      Color(0xff014567),
                      Color(0xff014567),
                    ], begin: Alignment.topCenter, end: Alignment.bottomCenter)
                        .createShader(bounds),
                blendMode: BlendMode.color,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 15.w),
                  height: 25.h,
                  width: double.infinity,
                  child: CachedNetworkImage(
                      imageUrl:
                          "$baseUrlImage${state.results[Random().nextInt(state.results.length)].backdropPath}",
                      fit: BoxFit.fitHeight),
                )),
            Positioned(
              top: 5.h,
              left: 7.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                    },
                    child: const Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Welcome',
                    style: TextStyle(
                      height: 1,
                      color: Colors.white,
                      fontFamily: 'Dongle',
                      fontWeight: FontWeight.bold,
                      fontSize: 25.sp,
                    ),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 80.w),
                    child: Text(
                      'Millions of movies, TV shows and people to discover. Explore now.',
                      style: TextStyle(
                        height: 1,
                        color: Colors.white,
                        fontFamily: 'Dongle',
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]);
        }
        return Container();
      },
    );
  }
}
