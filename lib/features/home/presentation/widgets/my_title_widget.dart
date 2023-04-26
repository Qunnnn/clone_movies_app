import '../../../../constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
SizedBox titleWidget(String title) {
    return SizedBox(
                    width: 30.w,
                    child: Text(
                      title,
                      style: titleStyle,
                    ),
                  );
  }