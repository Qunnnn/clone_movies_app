import 'package:clone_movies_app/features/home/presentation/widgets/my_carousel_slider_widget.dart';
import 'package:clone_movies_app/features/intro/intro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sizer/sizer.dart';
import '../../../../shared/constants/constants.dart';

class UpcomingMovie extends StatefulWidget {
  const UpcomingMovie({super.key});

  @override
  State<UpcomingMovie> createState() => _UpcomingMovieState();
}

class _UpcomingMovieState extends State<UpcomingMovie> {
  late final UpComingMovieBloc upComingMovieBloc;

  @override
  void initState() {
    upComingMovieBloc = BlocProvider.of<UpComingMovieBloc>(context)
      ..add(FetchMovieEvent());
    super.initState();
  }

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
            if (state is LoadingState) {
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
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) => DetailPage(
                            //           isTvShow: false,
                            //           data: snapshot.data!,
                            //           index: index),
                            //     ));
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              '$baseUrlImage${movie.backdropPath}',
                              width: 174.5,
                              height: 250,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        // ClipRRect(
                        //   borderRadius: const BorderRadius.only(
                        //       bottomLeft: Radius.circular(20),
                        //       bottomRight: Radius.circular(20)),
                        //   child: BackdropFilter(
                        //     filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        //     child: Container(
                        //       height: 60,
                        //       width: 175,
                        //       padding: const EdgeInsets.all(10),
                        //       color: Colors.black26,
                        //       child: Column(
                        //         mainAxisAlignment:
                        //             MainAxisAlignment.spaceAround,
                        //         crossAxisAlignment: CrossAxisAlignment.start,
                        //         children: [
                        //           Text(
                        //             data[index].title ?? data[index].name!,
                        //             overflow: TextOverflow.ellipsis,
                        //             style:
                        //                 Theme.of(context).textTheme.bodyLarge,
                        //           ),
                        //           Text(
                        //             getGenres(data[index].genreIds!),
                        //             overflow: TextOverflow.ellipsis,
                        //             style: const TextStyle(fontSize: 12),
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // ),
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
