import '../../../../constants/app_constants.dart';
import 'movie_list.dart';
import 'trending_selection_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/trending_movie_bloc.dart';
import '../bloc/trending_movie_event.dart';
import '../bloc/trending_movie_state.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class TrendingMovie extends StatefulWidget {
  const TrendingMovie({super.key});

  @override
  State<TrendingMovie> createState() => _TrendingMovieState();
}

class _TrendingMovieState extends State<TrendingMovie> {
  late final TrendingMovieBloc trendingMovieBloc;
  String time = 'day';

  callback(newTime) {
    setState(() {
      time = newTime;
    });
    context.read<TrendingMovieBloc>().add(LoadTrendingMovie(timeWindow: time));
  }

  @override
  void initState() {
    trendingMovieBloc = BlocProvider.of<TrendingMovieBloc>(context)
      ..add(LoadTrendingMovie(timeWindow: time));
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
                'Trending',
                style: topicStyle,
              ),
              SizedBox(
                width: 3.w,
              ),
              TrendingSelection(callbackFunction: callback),
            ],
          ),
        ),
        SizedBox(
          height: 30.h,
          width: double.infinity,
          child: BlocBuilder<TrendingMovieBloc, TrendingMovieState>(
              builder: (context, state) {
            if (state is LoadingState) {
              return SpinKitDoubleBounce(
                color: Colors.white,
                size: 5.h,
              );
            }
            if (state is LoadedState) {
              return MovieList(list: state.movies);
            }
            return Container();
          }),
        ),
      ],
    );
  }
}
