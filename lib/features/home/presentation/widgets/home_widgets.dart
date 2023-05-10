import '../../../../constants/app_constants.dart';
import '../../../details/presentation/bloc/cast_bloc.dart';
import '../../../details/presentation/bloc/cast_event.dart';
import '../../../details/presentation/bloc/details_bloc.dart';
import '../../../details/presentation/pages/details_page.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../constants/assest_path.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../domain/entities/entity.dart';

//MovieList
ListView buildMovieListWidget({required List<dynamic> list}) {
  return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: list.length,
      itemBuilder: ((context, index) => GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => MultiBlocProvider(providers: [
                        BlocProvider(
                          create: (context) => DetailsBloc()
                            ..add(LoadDetailsEvent(id: list[index].id)),
                        ),
                        BlocProvider(
                          create: (context) => CastBloc()
                            ..add(LoadCastEvent(id: list[index].id)),
                        ),
                      ], child: const DetailsPage())));
            },
            child: Container(
              margin: EdgeInsets.only(right: 1.w, left: index == 0 ? 5.w : 1.w),
              height: 40.h,
              width: 35.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: Colors.black),
              child: Stack(children: [
                Positioned(
                    right: 2.w,
                    left: 2.w,
                    top: 1.h,
                    bottom: 5.h,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: CachedNetworkImage(
                          imageUrl: "$baseUrlImage${list[index].posterPath}",
                          fit: BoxFit.fill,
                        ))),
                Positioned(
                    bottom: 2.h,
                    left: 2.w,
                    child: buildTitleWidget(list[index].title)),
                Positioned(
                    bottom: 0.5.h,
                    left: 2.w,
                    child: Row(
                      children: [
                        Text(
                          DateFormat.yMMMd()
                              .format(DateTime.parse(list[index].releaseDate)),
                          style: releaseTimeStyle,
                        ),
                      ],
                    )),
              ]),
            ),
          )));
}

// TvListWidget
ListView buildTvListWidget({required List<Entity> list}) {
  return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: list.length,
      itemBuilder: ((context, index) => Container(
            margin: EdgeInsets.only(right: 1.w, left: index == 0 ? 5.w : 1.w),
            height: 40.h,
            width: 35.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: Colors.black),
            child: Stack(children: [
              Positioned(
                  right: 2.w,
                  left: 2.w,
                  top: 1.h,
                  bottom: 5.h,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: CachedNetworkImage(
                        imageUrl: "$baseUrlImage${list[index].posterPath}",
                        fit: BoxFit.fill,
                      ))),
              Positioned(
                  bottom: 2.h,
                  left: 2.w,
                  child: buildTitleWidget(list[index].title)),
              Positioned(
                  bottom: 0.5.h,
                  left: 2.w,
                  child: Text(
                    DateFormat.yMMMd()
                        .format(DateTime.parse(list[index].releaseDate)),
                    style: releaseTimeStyle,
                  )),
            ]),
          )));
}

// NavBarWidget
SizedBox buildNavBarWidget() {
  return SizedBox(
    height: 8.h,
    child: GNav(
        gap: 10,
        backgroundColor: Colors.black45,
        color: Colors.white,
        activeColor: Colors.white,
        rippleColor: Colors.grey,
        tabActiveBorder: Border.all(color: Colors.white38),
        tabBackgroundColor: Colors.grey.shade900,
        tabBorderRadius: 50,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        padding: const EdgeInsets.all(10),
        tabs: const [
          GButton(
            icon: FontAwesomeIcons.house,
            text: 'Home',
          ),
          GButton(
            icon: FontAwesomeIcons.heart,
            text: 'like',
          ),
          GButton(
            icon: FontAwesomeIcons.magnifyingGlass,
            text: 'Search',
          ),
          GButton(
            icon: FontAwesomeIcons.person,
            text: 'Profile',
          ),
        ]),
  );
}

// Title Widget
SizedBox buildTitleWidget(String title) {
  return SizedBox(
    width: 30.w,
    child: Text(
      title,
      style: titleStyle,
    ),
  );
}
