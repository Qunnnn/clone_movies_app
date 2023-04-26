import '../../../../constants/assest_path.dart';
import '../../../details/presentation/bloc/details_bloc.dart';
import '../../../home/presentation/bloc/popular_tv_bloc.dart';
import '../../../home/presentation/bloc/top_rated_movie_bloc.dart';
import '../../../home/presentation/bloc/trending_movie_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../../home/presentation/pages/home_page.dart';
import 'background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/intro_bloc.dart';
import '../widgets/my_widget.dart';
import 'dart:math';
class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: BlocBuilder<IntroBloc, PosterState>(
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
                  Positioned(
                      top: -10,
                      left: -90,
                      child: Background(list: state.results)),
                  Positioned(
                    top: 2.h,
                    right: 10.w,
                    left: 10.w,
                    child: SvgPicture.network(
                      netFlixLogo,
                    ),
                  ),
                  Positioned(
                      bottom: 6.h,
                      right: 10.w,
                      left: 10.w,
                      child: Column(
                        children: [
                          MyTextField(
                              hintText: 'Email',
                              icon: FontAwesomeIcons.person,
                              obscureText: false),
                          SizedBox(
                            height: 2.h,
                          ),
                          MyTextField(
                              hintText: 'Password',
                              icon: FontAwesomeIcons.key,
                              obscureText: true),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              'forget Password',
                              style: TextStyle(
                                color: Colors.lightBlue,
                                fontFamily: 'Dongle',
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          LoginButton(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      MultiBlocProvider(providers: [
                                        BlocProvider(
                                            create: (context) => IntroBloc()),
                                        BlocProvider(
                                            create: (context) =>
                                                TrendingMovieBloc()),
                                        BlocProvider(create: (context) => PopularTvBloc()),
                                        BlocProvider(create: (context) => TopRatedMovieBloc()),
                                        BlocProvider(create: (context) => DetailsBloc(),)
                                      ], child: HomePage(welcomeImage: state.results[Random().nextInt(state.results.length)].backdropPath,))));
                            },
                          ),
                        ],
                      )),
                ],
              );
            }
            return Container();
          },
        ));
  }
}
