import '../../../../constants/app_constants.dart';
import '../../domain/entities/entity.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../constants/assest_path.dart';
import 'my_title_widget.dart';
import 'package:intl/intl.dart';
import 'package:cached_network_image/cached_network_image.dart';
class TvList extends StatelessWidget {
  List<Entity> list;

  TvList({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        itemBuilder: ((context, index) => Container(
          margin:
              EdgeInsets.only(right: 1.w, left: index == 0 ? 5.w : 1.w),
          height: 40.h,
          width: 35.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.black),
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
                          ))
            ),
            Positioned(
                bottom: 2.h,
                left: 2.w,
                child: titleWidget(list[index].title)),
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
}
