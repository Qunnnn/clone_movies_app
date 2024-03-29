import 'package:clone_movies_app/shared/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

//text_field_widget
Widget MyTextField(
    {required String hintText,
    required TextEditingController controller,
    required IconData icon,
    required bool obscureText,
    required BuildContext context}) {
  return TextFormField(
    controller: controller,
    obscureText: obscureText,
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter your ${hintText.toLowerCase()}';
      }
      return null;
    },
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.black,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black),
        borderRadius: BorderRadius.circular(15),
      ),
      fillColor: Colors.white,
      hintText: hintText,
      hintStyle: hintStyle,
      filled: true,
      prefixIcon: Icon(
        icon,
        color: Colors.black,
        size: 3.h,
      ),
    ),
  );
}

//button_widge
Container LoginButton({required Function()? onTap}) {
  return Container(
    height: 6.h,
    width: 30.w,
    padding: EdgeInsets.zero,
    decoration:
        BoxDecoration(borderRadius: BorderRadius.circular(20), boxShadow: const [
      BoxShadow(
        color: Colors.black,
        blurRadius: 0.5,
        offset: Offset(2, 3),
      )
    ]),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.grey.shade500,
          ),
          onPressed: onTap,
          child: Center(
            child: Text(
              'Login',
              style: TextStyle(
                fontFamily: 'Dongle',
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          )),
    ),
  );
}
