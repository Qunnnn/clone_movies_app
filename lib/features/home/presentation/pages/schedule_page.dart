import 'dart:async';
import 'package:clone_movies_app/constants/app_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';
import '../../../../service/local_notification_service.dart';
import '../widgets/widgets.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  late final NotificationService _notificationService;
  TimeOfDay time = TimeOfDay.now();
  bool confirm = false;
  // TimeOfDay getSystemTime() {
  //   TimeOfDay now = TimeOfDay.now();

  //   Timer.periodic(const Duration(seconds: 1), (timer) {
  //     if (mounted) {
  //       setState(() {
  //         now = TimeOfDay.now();
  //       });
  //     }
  //   });
  //   return now;
  // }

  @override
  void initState() {
    // getSystemTime();
    _notificationService = NotificationService();
    _notificationService.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: schedulePageBackGroundColor,
      appBar: AppBar(
        title: Text(
          'Daily Schedule',
          style: topicStyle.copyWith(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 15.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              digitalClockWidget(time: time.hour.toString().padLeft(2, '0')),
              SizedBox(
                height: 5.h,
                child: const VerticalDivider(
                  color: Colors.black,
                ),
              ),
              digitalClockWidget(time: time.minute.toString().padLeft(2, '0')),
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Pick up your schedule time!',
                style:
                    contentStyle.copyWith(color: Colors.white, fontSize: 20.sp),
              ),
              SizedBox(
                width: 5.w,
              ),
              GestureDetector(
                onTap: () async {
                  TimeOfDay? newTime = await showTimePicker(
                    context: context,
                    initialTime: time,
                    builder: (context, child) {
                      return MediaQuery(
                          data: MediaQuery.of(context)
                              .copyWith(alwaysUse24HourFormat: true),
                          child: child!);
                    },
                  );

                  if (newTime == null) return;
                  setState(() {
                    time = newTime;
                  });
                },
                child: Container(
                  height: 5.h,
                  width: 5.h,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10)),
                  child: const Icon(
                    FontAwesomeIcons.clock,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () {
                _notificationService.scheduleDailyNotification(
                    id: 0,
                    title: 'Schedule',
                    body: 'It\s time for movie!',
                    hour: time.hour,
                    minute: time.minute);
                Navigator.pop(context);
              },
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.red),
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Text(
                    'Confirm',
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
