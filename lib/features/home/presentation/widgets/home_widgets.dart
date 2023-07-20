import 'package:clone_movies_app/shared/config/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../shared/constants/constants.dart';
import '../../../../shared/utils/services/local_storage_service.dart';
import '../../domain/domain.dart';

//MovieList
ListView buildMovieListWidget({required List<dynamic> list}) {
  return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: list.length,
      itemBuilder: ((context, index) => GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                AppRoutes.DetailPage,
                arguments: list[index].id,
              );
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




ListTile reusableListTile({required IconData icon, String? title}) {
  return ListTile(
    leading: Icon(
      icon,
      color: Colors.white,
      size: 3.h,
    ),
    title: Text(
      title!,
      style: TextStyle(
          color: Colors.white, fontSize: 20.sp, fontWeight: FontWeight.w500),
    ),
  );
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

//Digital Clock Widget
Container digitalClockWidget({required String time}) {
  return Container(
    height: 20.h,
    width: 20.h,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black, width: 2),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Center(
      child: Text(
        time,
        style: TextStyle(
            color: Colors.white, fontSize: 70.sp, fontWeight: FontWeight.w700),
      ),
    ),
  );
}
