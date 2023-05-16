import 'package:clone_movies_app/service/local_notification_service.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../widgets/widgets.dart';

class HomePage extends StatefulWidget {
 const HomePage({super.key, });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final NotificationService _notificationService;

 late  String image;
  @override
  void initState() {
    _notificationService = NotificationService();
    _notificationService.init();
    _notificationService.showNotification(
        id: 0, title: 'Welcome', body: 'Have a nice day!');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: buildNavBarWidget(),
      backgroundColor: Colors.black12,
      appBar: Welcome(),
      drawer: drawerWidget(context),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xff2A2F4F),
                      Color(0xff393646),
                      Color(0xff393646),
                      Color(0xff7B8FA1),
                    ],
                  ),
                ),
                child: Column(
                  children: [
                    const TrendingMovie(),
                    const TopRatedMovie(),
                    const PopularTv(),
                    SizedBox(
                      height: 5.h,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
