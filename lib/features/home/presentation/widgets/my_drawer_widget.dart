import 'package:clone_movies_app/features/home/home.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

import '../../../../shared/config/routes/routes.dart';
import '../../../../shared/constants/constants.dart';
import '../../../../shared/utils/services/local_storage_service.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Text('Qun', style: accountNameStyle),
            ),
            accountEmail: Text(
              'Vantranquan123@gmail.com',
              style: accountEmailStyle,
            ),
            currentAccountPicture: ClipOval(
              child: CircleAvatar(
                child: Image.asset(
                  'assets/images/ava.JPG',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            currentAccountPictureSize: const Size(70, 70),
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/background.png'),
                  fit: BoxFit.cover),
            ),
          ),
          const ReusableListTile(icon: FontAwesomeIcons.user, title: 'Profile'),
          const Divider(thickness: 0.5),
          const ReusableListTile(
              icon: FontAwesomeIcons.bell, title: 'Notifications'),
          const Divider(thickness: 0.5),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.SchedulePage);
            },
            child: const ReusableListTile(
                icon: FontAwesomeIcons.calendarCheck, title: 'Schedule'),
          ),
          const Divider(thickness: 0.5),
          const ReusableListTile(
              icon: FontAwesomeIcons.gear, title: 'Settings'),
          const Divider(thickness: 0.5),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: GestureDetector(
              onTap: () async {
                LocalStorageService.instance.delete(key: statusLoginKey);
                await AppPages.getStatusLogin();
                Navigator.pushReplacementNamed(context, AppRoutes.Initial);
              },
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.red),
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Text(
                    'Log out',
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
