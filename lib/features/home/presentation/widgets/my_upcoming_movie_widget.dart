import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:clone_movies_app/features/home/presentation/widgets/my_carousel_slider_widget.dart';
import 'package:clone_movies_app/features/intro/intro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sizer/sizer.dart';
import '../../../../shared/config/routes/routes_config.dart';
import '../../../../shared/constants/constants.dart';

class UpcomingMovie extends StatelessWidget {
  const UpcomingMovie({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 5.w),
          child: Row(
            children: [
              Text(
                'Upcoming Movie',
                style: topicStyle,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 30.h,
          width: double.infinity,
          child: BlocBuilder<UpComingMovieBloc, UpComingMovieState>(
              builder: (context, state) {
            if (state is Loading) {
              return SpinKitDoubleBounce(
                color: Colors.white,
                size: 5.h,
              );
            }
            if (state is LoadedMoviesState) {
              return MyCarouselSlider(
                  itemBuilder: (context, index, realindex) {
                    final movie = state.results[index];
                    return Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              AppRoutes.DetailPage,
                              arguments: movie.id,
                            );
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: CachedNetworkImage(
                              imageUrl: '$baseUrlImage${movie.posterPath}',
                              width: 170,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20)),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Container(
                              height: 55,
                              width: 170,
                              padding: const EdgeInsets.all(10),
                              color: Colors.black26,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    movie.title,
                                    overflow: TextOverflow.ellipsis,
                                    style: contentStyle.copyWith(
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                  itemCount: state.results.length);
            }
            return Container();
          }),
        ),
      ],
    );
  }
}
