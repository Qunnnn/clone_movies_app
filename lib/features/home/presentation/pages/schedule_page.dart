import 'dart:async';
import 'package:clone_movies_app/features/home/presentation/widgets/my_digital_clock_widget.dart';
import 'package:clone_movies_app/shared/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';
import '../../../../shared/utils/services/services.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  final NotificationService _notificationService = NotificationService();
  TimeOfDay time = TimeOfDay.now();
  LocalStorageService localStorageService = LocalStorageService();
  late bool activeNoti;
  late ScheduleDailyDetails scheduleDailyDetails;

  TimeOfDay getSystemTime() {
    TimeOfDay now = TimeOfDay.now();

    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          now = TimeOfDay.now();
        });
      }
    });
    return now;
  }

  setNoti() {
    if (activeNoti == true) {
      _notificationService.scheduleDailyNotification(
        id: 1,
        title: 'Schedule',
        body: 'It\'s time for movie!',
        hour: time.hour,
        minute: time.minute,
        payload: '550',
      );
    } else {
      _notificationService.cancelNotification(id: 1);
    }
  }

  getScheduleStatus() async {
    activeNoti =
        await localStorageService.readStatus(key: 'notificationStatus') ??
            false;
    setState(() {
      activeNoti;
      setNoti();
    });
  }

  Future<ScheduleDailyDetails> updateScheduleTime() async {
    ScheduleDailyDetails scheduleDailyDetails =
        ScheduleDailyDetails.fromJson(await localStorageService.readSchedule());
    return scheduleDailyDetails;
  }

  @override
  void initState() {
    getSystemTime();
    getScheduleStatus();
    _notificationService.intialize();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _notificationService.close();
    // mySub.cancel();
    super.dispose();
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 15.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DigitalClockWidget(
                  time: getSystemTime().hour.toString().padLeft(2, '0')),
              SizedBox(
                height: 5.h,
                child: const VerticalDivider(
                  color: Colors.black,
                ),
              ),
              DigitalClockWidget(
                  time: getSystemTime().minute.toString().padLeft(2, '0')),
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
                    scheduleDailyDetails =
                        ScheduleDailyDetails(time.hour, time.minute , true);
                    localStorageService.saveSchedule(scheduleDailyDetails);
                    setNoti();
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
          FutureBuilder(
            future: updateScheduleTime(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data!.status == false) {
                  return Container();
                }
                return Container(
                  margin: EdgeInsets.only(top: 1.h, left: 15.w),
                  height: 7.h,
                  width: 70.w,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 5.w,
                      ),
                      Icon(
                        FontAwesomeIcons.calendarCheck,
                        color: Colors.white,
                        size: 2.5.h,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        '${snapshot.data!.hour.toString().padLeft(2, '0')}:${snapshot.data!.minute.toString().padLeft(2, '0')}',
                        style: contentStyle.copyWith(
                            color: Colors.white, fontSize: 20.sp),
                      ),
                      const Spacer(),
                      Switch(
                        value: activeNoti,
                        onChanged: (value) {
                          localStorageService.writeStatus(
                              key: 'notificationStatus', status: value);
                          getScheduleStatus();
                        },
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      GestureDetector(
                        onTap: () {
                          _notificationService.cancelNotification(id: 1);
                          localStorageService.delete(
                              key: "scheduleDailyDetails");
                          localStorageService.delete(key: "notificationStatus");
                          setState(() {
                            updateScheduleTime();
                            getScheduleStatus();
                          });
                        },
                        child: Icon(
                          FontAwesomeIcons.trash,
                          color: Colors.white,
                          size: 2.5.h,
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                    ],
                  ),
                );
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }
}
