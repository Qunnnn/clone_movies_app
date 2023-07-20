import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../shared/constants/app_constants.dart';

class ReusableTitleWidget extends StatelessWidget {
  const ReusableTitleWidget({
    super.key,
    required this.title
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 30.w,
      child: Text(
        title,
        style: titleStyle,
      ),
    );
  }
}