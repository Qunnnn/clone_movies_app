import 'package:clone_movies_app/features/details/presentation/bloc/trailer_bloc/trailer_bloc.dart';
import 'package:clone_movies_app/features/details/presentation/bloc/trailer_bloc/trailer_event.dart';
import 'package:clone_movies_app/features/details/presentation/bloc/trailer_bloc/trailer_state.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../shared/constants/constants.dart';
import '../bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../widgets/widgets.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final Uri _url = Uri.parse('https://flutter.dev');
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      final id = ModalRoute.of(context)!.settings.arguments as int;
      BlocProvider.of<DetailsBloc>(context).add(LoadDetailsEvent(id: id));
      BlocProvider.of<CastBloc>(context).add(LoadCastEvent(id: id));
      BlocProvider.of<TrailerBloc>(context).add(LoadTrailerEvent(id: id));
    });
    super.initState();
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
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
                width: double.infinity,
                child: Stack(children: [
                  SizedBox(
                    width: double.infinity,
                    height: 31.h,
                    child: Stack(children: [
                      CachedNetworkImage(
                        imageUrl: "$baseUrlImage${state.details.poster_path}",
                        fit: BoxFit.fill,
                        width: double.infinity,
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 1.h, horizontal: 5.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: 5.h,
                                width: 12.w,
                                child: Material(
                                  color: Colors.black,
                                  clipBehavior: Clip.hardEdge,
                                  borderRadius: BorderRadius.circular(20),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Center(
                                      child: Icon(
                                        FontAwesomeIcons.arrowLeft,
                                        color: Colors.white,
                                        size: 2.5.h,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5.h,
                                width: 12.w,
                                child: Material(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(20),
                                  clipBehavior: Clip.hardEdge,
                                  child: InkWell(
                                    onTap: () {},
                                    child: Center(
                                      child: Icon(
                                        FontAwesomeIcons.bell,
                                        size: 2.5.h,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: BlocBuilder<TrailerBloc, TrailerState>(
                          builder: (context, state) {
                            if (state is TrailerLoading) {
                              return SpinKitCircle(
                                size: 7.h,
                                color: Colors.white,
                              );
                            }
                            if (state is TrailerLoaded) {
                              return Material(
                                color: Colors.transparent,
                                clipBehavior: Clip.hardEdge,
                                borderRadius: BorderRadius.circular(20),
                                child: InkWell(
                                  onTap: () {
                                    _launchUrl();
                                  },
                                  child: Icon(
                                    FontAwesomeIcons.circlePlay,
                                    color: Colors.white,
                                    size: 5.h,
                                  ),
                                ),
                              );
                            }
                            return Container();
                          },
                        ),
                      ),
                    ]),
                  ),
                  Positioned(
                    top: 30.h,
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
                          padding:
                              EdgeInsets.only(left: 5.w, top: 0, right: 5.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.details.title,
                                style: titleStyle.copyWith(
                                    color: const Color(0xff73A9AD),
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
                                                '• ${state.details.genres[index].name}',
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
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Trailer',
                                    style: topicStyle.copyWith(
                                        color: Colors.black,
                                        fontSize: 20.sp,
                                        letterSpacing: -0.5),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                            ],
                          ),
                        ),
                      ),
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
