import '../../../../constants/assest_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/cast_bloc.dart';
import '../bloc/cast_state.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CastWidget extends StatelessWidget {
  const CastWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CastBloc, CastState>(
      builder: (context, state) {
        if (state is LoadingCastState) {
          return Center(
            child: SpinKitPianoWave(
              color: Colors.black,
              size: 3.h,
            ),
          );
        }
        if (state is LoadedCastState) {
          return SizedBox(
            height: 25.h,
            width: double.infinity,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.casts.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(left: index == 0 ? 0 : 3.w),
                  child: Container(
                    width: 35.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black,
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                            top: 0,
                            bottom: 7.h,
                            left: 0,
                            right: 0,
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20)),
                              child: Image.network(
                                '$baseUrlImage${state.casts[index].profilePath}',
                                fit: BoxFit.fill,
                              ),
                            )),
                        Positioned(
                            bottom: 3.h,
                            left: 3.w,
                            child: Text(
                              state.casts[index].name,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Dongle',
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold),
                            )),
                        Positioned(
                            bottom: 1.h,
                            left: 3.w,
                            child: Text(
                              state.casts[index].character,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Dongle',
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w400),
                            )),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }

        return Container();
      },
    );
  }
}
