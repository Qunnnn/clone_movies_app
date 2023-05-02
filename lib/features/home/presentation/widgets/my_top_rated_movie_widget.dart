import 'package:clone_movies_app/features/home/presentation/widgets/home_widgets.dart';
import '../../../../constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../bloc/home_bloc_injection.dart';

class TopRatedMovie extends StatefulWidget {
  const TopRatedMovie({super.key});

  @override
  State<TopRatedMovie> createState() => _TopRatedMovieState();
}

class _TopRatedMovieState extends State<TopRatedMovie> {
  late final TopRatedMovieBloc topRatedMovieBloc;

  @override
  void initState() {
    topRatedMovieBloc = BlocProvider.of<TopRatedMovieBloc>(context)
      ..add(LoadTopRatedMovie());
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
                'Top Rated',
                style: topicStyle,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 30.h,
          width: double.infinity,
          child: BlocBuilder<TopRatedMovieBloc, TopRatedMovieState>(
              builder: (context, state) {
            if (state is LoadingTopRatedState) {
              return SpinKitDoubleBounce(
                color: Colors.white,
                size: 5.h,
              );
            }
            if (state is LoadedTopRatedState) {
              return buildMovieListWidget(list: state.movies);
            }
            return Container();
          }),
        ),
      ],
    );
  }
}
