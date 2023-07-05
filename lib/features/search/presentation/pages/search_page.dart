import 'package:cached_network_image/cached_network_image.dart';
import 'package:clone_movies_app/constants/constants.dart';
import 'package:clone_movies_app/features/search/presentation/bloc/search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black12,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Search Screen',
                style:
                    titleStyle.copyWith(color: Colors.white, fontSize: 30.sp),
              ),
              SizedBox(
                height: 1.h,
              ),
              TextField(
                cursorColor: Colors.grey.shade500,
                onChanged: (value) {
                  BlocProvider.of<SearchBloc>(context)
                      .add(MovieSearchEvent(query: value));
                },
                style: titleStyle.copyWith(fontSize: 17.sp),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 1.h),
                  prefixIcon: Icon(
                    FontAwesomeIcons.magnifyingGlass,
                    color: Colors.grey[500],
                    size: 20,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide:
                          BorderSide(color: Colors.grey.shade500, width: 2)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide:
                          BorderSide(color: Colors.grey.shade500, width: 2)),
                ),
              ),
              BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  if (state is LoadingState) {
                    return Expanded(
                      child: Center(
                        child: SpinKitDoubleBounce(
                          color: Colors.white,
                          size: 5.h,
                        ),
                      ),
                    );
                  }
                  if (state is LoadedState) {
                    return Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.only(
                              top: 2.h, bottom: 1.h, left: 0.5.w, right: 0.5.w),
                          itemCount: state.results.length,
                          itemBuilder: (context, index) {
                            final movie = state.results[index];
                            return Container(
                              margin: EdgeInsets.only(bottom: 1.h),
                              decoration: BoxDecoration(
                                color: Colors.grey[400],
                                borderRadius: BorderRadius.circular(15),
                              ),
                              height: 10.h,
                              child: Row(
                                children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            "$baseUrlImage${movie.poster_path}",
                                        fit: BoxFit.fill,
                                      )),
                                  Text(
                                    movie.poster_path,
                                    style: titleStyle,
                                  ),
                                ],
                              ),
                            );
                          }),
                    );
                  }
                  return Container();
                },
              ),
            ]),
          ),
        ));
  }
}
