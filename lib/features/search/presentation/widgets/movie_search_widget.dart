import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import '../../../../shared/config/routes/routes_config.dart';
import '../../../../shared/constants/constants.dart';
import '../../domain/entities/enitity.dart';

class MovieSearchWidget extends StatelessWidget {
  const MovieSearchWidget({
    super.key,
    required this.movie,
  });

  final MovieSearchEntity movie;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
                Navigator.pushNamed(
                context,
                AppRoutes.DetailPage,
                arguments: movie.id,
              );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 1.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        height: 12.h,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: CachedNetworkImage(
                    imageUrl: "$baseUrlImage${movie.poster_path}",
                    fit: BoxFit.fill,
                  )),
            ),
            SizedBox(
              width: 2.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 70.w,
                  child: Text(movie.title,
                      style: titleStyle.copyWith(
                          color: Colors.black, fontSize: 18.sp)),
                ),
                Text(
                  DateFormat.yMMMd().format(DateTime.parse(movie.releaseDate)),
                  style: releaseTimeStyle.copyWith(
                      color: Colors.black, fontSize: 17.sp, height: -0.2),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
