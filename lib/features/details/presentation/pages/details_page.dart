import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../constants/app_constants.dart';
import '../../../../constants/assest_path.dart';
import '../bloc/bloc.dart';
import '../widgets/my_cast_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:cached_network_image/cached_network_image.dart';

class DetailsPage extends StatefulWidget {
  int id;
  DetailsPage({super.key, required this.id});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late final DetailsBloc detailsBloc;
  late final CastBloc castBloc;

  @override
  void initState() {
    detailsBloc = BlocProvider.of<DetailsBloc>(context)
      ..add(LoadDetailsEvent(id: widget.id));
    castBloc = BlocProvider.of<CastBloc>(context)
      ..add(LoadCastEvent(id: widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(child: BlocBuilder<DetailsBloc, DetailsState>(
        builder: (context, state) {
          if (state is LoadingDetailsState) {
            return SpinKitCircle(
              size: 10.h,
              color: Colors.white,
            );
          }
          if (state is LoadedDetailsState) {
            return SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Stack(children: [
                Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: 60.h,
                    child: SizedBox(
                      width: double.infinity,
                      child: CachedNetworkImage(
                        imageUrl: "$baseUrlImage${state.details.poster_path}",
                        fit: BoxFit.fill,
                      ),
                    )),
                Positioned(
                  top: 35.h,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color(0xffFFFAF4),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                    ),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.only(left: 5.w, top: 0, right: 5.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              state.details.title,
                              style: titleStyle.copyWith(
                                  color: Colors.teal.shade300,
                                  fontSize: 25.sp,
                                  letterSpacing: -1),
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  ...List.generate(
                                      state.details.genres.length,
                                      (index) => Padding(
                                            padding: const EdgeInsets.only(
                                                right: 10),
                                            child: Text(
                                              '• ' +
                                                  state.details.genres[index]
                                                      .name
                                                      .toString(),
                                              style: genreStyle,
                                            ),
                                          ))
                                ],
                              ),
                            ),
                            Text(
                              'Overview:',
                              style: topicStyle.copyWith(
                                  color: Colors.black,
                                  fontSize: 20.sp,
                                  letterSpacing: -0.5),
                            ),
                            Text(
                              state.details.overview,
                              textAlign: TextAlign.justify,
                              style: contentStyle,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Status: ',
                                  style: topicStyle.copyWith(
                                      color: Colors.black,
                                      fontSize: 20.sp,
                                      letterSpacing: -0.5),
                                ),
                                Text(
                                  state.details.status,
                                  style: contentStyle,
                                ),
                              ],
                            ),
                            const CastWidget(),
                            SizedBox(
                              height: 3.h,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 1.h,
                  left: 3.w,
                  right: 3.w,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 5.h,
                          width: 10.w,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: Icon(
                              FontAwesomeIcons.arrowLeft,
                              color: Colors.white,
                              size: 2.5.h,
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 5.h,
                          width: 10.w,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: Icon(
                              FontAwesomeIcons.bell,
                              size: 2.5.h,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            );
          }
          return Container();
        },
      )),
    );
  }
}
