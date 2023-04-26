import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../constants/assest_path.dart';
class Welcome extends StatelessWidget {
  String welcomImage;
   Welcome({
    super.key,
    required this.welcomImage,
  });

  @override
  Widget build(BuildContext context) {
        return Stack(children: [
          ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(colors: [
                    Color(0xff012841),
                    Color(0xff012841),
                    Color(0xff014567),
                    Color(0xff014567),
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter)
                      .createShader(bounds),
              blendMode: BlendMode.color,
              child: SizedBox(
                width: double.infinity,
                child: CachedNetworkImage(imageUrl: "$baseUrlImage$welcomImage" , fit: BoxFit.fitHeight,) ,
              )),
          Positioned(
              top: 2.h,
              left: 5.w,
              child: const Icon(
                Icons.menu,
                color: Colors.white,
              )),
          Positioned(
              top: 2.h,
              right: 5.w,
              child: const Icon(
                Icons.person,
                color: Colors.white,
              )),
          Positioned(
            top: 6.h,
            left: 5.w,
            child: Text(
              'Welcome',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Dongle',
                fontWeight: FontWeight.bold,
                fontSize: 25.sp,
              ),
            ),
          ),
          Positioned(
            top: 11.h,
            left: 5.w,
            child: Text(
              'Millions of movies, TV shows and people to discover. Explore now.',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Dongle',
                fontWeight: FontWeight.bold,
                fontSize: 14.sp,
              ),
            ),
          ),
        ]);
      }

  }

