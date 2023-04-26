import '../../../../constants/app_constants.dart';
import '../bloc/popular_tv_bloc.dart';
import '../bloc/popular_tv_event.dart';
import '../bloc/popular_tv_state.dart';
import 'tv_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PopularTv extends StatefulWidget {
  const PopularTv({super.key});

  @override
  State<PopularTv> createState() => _PopularTvState();
}

class _PopularTvState extends State<PopularTv> {
  late final PopularTvBloc popularTvBloc;

  @override
  void initState() {
    popularTvBloc = BlocProvider.of<PopularTvBloc>(context)
      ..add(LoadPopularTvEvent());
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
                'Popular Tv',
                style: topicStyle,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 30.h,
          width: double.infinity,
          child: BlocBuilder<PopularTvBloc, PopularTvState>(
              builder: (context, state) {
            if (state is LoadingPopularTvState) {
              return SpinKitDoubleBounce(
                color: Colors.white,
                size: 5.h,
              );
            }
            if (state is LoadedPopularTvState) {
              return TvList(list: state.movies);
            }
            return Container();
          }),
        ),
      ],
    );
  }
}
