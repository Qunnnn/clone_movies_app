import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ReusableListTile extends StatelessWidget {
  const ReusableListTile({super.key, required this.icon, required this.title});
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.white,
        size: 3.h,
      ),
      title: Text(
        title,
        style: TextStyle(
            color: Colors.white, fontSize: 20.sp, fontWeight: FontWeight.w500),
      ),
    );
  }
}