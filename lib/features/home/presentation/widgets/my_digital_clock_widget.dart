import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DigitalClockWidget extends StatelessWidget {
  const DigitalClockWidget({
    super.key,
    required this.time
  });
  final String time;
  @override
  Widget build(BuildContext context) {
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
              color: Colors.white,
              fontSize: 70.sp,
              fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
