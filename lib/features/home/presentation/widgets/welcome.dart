import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:clone_movies_app/features/intro/intro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sizer/sizer.dart';
import '../../../../constants/assest_path.dart';

class Welcome extends StatefulWidget implements PreferredSizeWidget {
  Welcome({
    super.key,
  });

  @override
  State<Welcome> createState() => _WelcomeState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, 20.h);
}

class _WelcomeState extends State<Welcome> {
  late final IntroBloc _introBloc;

  @override
  void initState() {
    // TODO: implement initState
    _introBloc = BlocProvider.of<IntroBloc>(context)..add(IntroEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IntroBloc, PosterState>(
      builder: (context, state) {
        if (state is LoadingPosterState) {
          return SpinKitFadingCircle(
            color: Colors.white,
            size: 10.h,
          );
        }
        if (state is LoadedIntroState) {
          return Stack(
            children: [
            ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(colors: [
                      Color(0xff012841),
                      Color(0xff012841),
                      Color(0xff014567),
                      Color(0xff014567),
                    ], begin: Alignment.topCenter, end: Alignment.bottomCenter)
                        .createShader(bounds),
                blendMode: BlendMode.color,
                child: SizedBox(
                  width: double.infinity,
                  child: CachedNetworkImage(
                    imageUrl:
                        "$baseUrlImage${state.results[Random().nextInt(state.results.length)].backdropPath}",
                    fit: BoxFit.fitHeight,
                  ),
                )),
            Positioned(
                top: 2.h,
                left: 5.w,
                child: GestureDetector(
                  onTap: () {
                    Scaffold.of(context).openDrawer();
                  },
                  child: const Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                )),
            Positioned(
              top: 6.h,
              left: 5.w,
              child: Text(
                'Welcome',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Dongle',
                  fontWeight: FontWeight.bold,
                  fontSize: 25.sp,
                ),
              ),
            ),
            Positioned(
              top: 11.h,
              left: 5.w,
              child: Text(
                'Millions of movies, TV shows and people to discover. Explore now.',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Dongle',
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp,
                ),
              ),
            ),
          ]);
        }
        return Container();
      },
    );
  }
}
