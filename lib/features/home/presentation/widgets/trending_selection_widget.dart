import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TrendingSelection extends StatefulWidget {
  final Function callbackFunction;
  const TrendingSelection({super.key, required this.callbackFunction});

  @override
  State<TrendingSelection> createState() => _TrendingSelectionState();
}

class _TrendingSelectionState extends State<TrendingSelection> {
  String time ='day';
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 3.5.h,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                time = 'day';
                widget.callbackFunction(time);
              });
            },
            child: Container(
              height: 3.5.h,
              width: 15.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: time == 'day' ? Colors.black : Colors.transparent,
              ),
              child: Center(
                  child: Text(
                'Today',
                style: TextStyle(
                  color: time == 'day' ? Colors.white : Colors.black,
                ),
              )),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                time = 'week';
                widget.callbackFunction(time);
              });
            },
            child: Container(
              height: 3.5.h,
              width: 20.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: time == 'week' ? Colors.black : Colors.transparent,
              ),
              child: Center(
                  child: Text(
                'This Week',
                style: TextStyle(
                  color: time == 'week' ? Colors.white : Colors.black,
                ),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
