import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../constants/constants.dart';
import '../../../../utils/services/local_storage_service.dart';
import '../../../details/details.dart';
import '../../domain/domain.dart';

//MovieList
ListView buildMovieListWidget({required List<dynamic> list}) {
  return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: list.length,
      itemBuilder: ((context, index) => GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DetailsPage(
                        id: list[index].id,
                      )));
            },
            child: Container(
              margin: EdgeInsets.only(right: 1.w, left: index == 0 ? 5.w : 1.w),
              height: 40.h,
              width: 35.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: Colors.black),
              child: Stack(children: [
                Positioned(
                    right: 2.w,
                    left: 2.w,
                    top: 1.h,
                    bottom: 5.h,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: CachedNetworkImage(
                          imageUrl: "$baseUrlImage${list[index].posterPath}",
                          fit: BoxFit.fill,
                        ))),
                Positioned(
                    bottom: 2.h,
                    left: 2.w,
                    child: buildTitleWidget(list[index].title)),
                Positioned(
                    bottom: 0.5.h,
                    left: 2.w,
                    child: Row(
                      children: [
                        Text(
                          DateFormat.yMMMd()
                              .format(DateTime.parse(list[index].releaseDate)),
                          style: releaseTimeStyle,
                        ),
                      ],
                    )),
              ]),
            ),
          )));
}

//  DrawerWidget
drawerWidget(BuildContext context) {
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
        reusableListTile(icon: FontAwesomeIcons.user, title: 'Profile'),
        const Divider(thickness: 0.5),
        reusableListTile(icon: FontAwesomeIcons.bell, title: 'Notifications'),
        const Divider(thickness: 0.5),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/schedule_page');
          },
          child: reusableListTile(
              icon: FontAwesomeIcons.calendarCheck, title: 'Schedule'),
        ),
        const Divider(thickness: 0.5),
        reusableListTile(icon: FontAwesomeIcons.gear, title: 'Settings'),
        const Divider(thickness: 0.5),
        SizedBox(
          height: 25.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: GestureDetector(
            onTap: () async {
              LocalStorageService localStorageService = LocalStorageService();
              localStorageService.delete(key: statusLoginKey);
              // await  AppPages.getStatusLogin();
              Navigator.pushReplacementNamed(context, '/');
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

ListTile reusableListTile({required IconData icon, String? title}) {
  return ListTile(
    leading: Icon(
      icon,
      color: Colors.white,
      size: 3.h,
    ),
    title: Text(
      title!,
      style: TextStyle(
          color: Colors.white, fontSize: 20.sp, fontWeight: FontWeight.w500),
    ),
  );
}

// TvListWidget
ListView buildTvListWidget({required List<Entity> list}) {
  return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: list.length,
      itemBuilder: ((context, index) => Container(
            margin: EdgeInsets.only(right: 1.w, left: index == 0 ? 5.w : 1.w),
            height: 40.h,
            width: 35.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: Colors.black),
            child: Stack(children: [
              Positioned(
                  right: 2.w,
                  left: 2.w,
                  top: 1.h,
                  bottom: 5.h,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: CachedNetworkImage(
                        imageUrl: "$baseUrlImage${list[index].posterPath}",
                        fit: BoxFit.fill,
                      ))),
              Positioned(
                  bottom: 2.h,
                  left: 2.w,
                  child: buildTitleWidget(list[index].title)),
              Positioned(
                  bottom: 0.5.h,
                  left: 2.w,
                  child: Text(
                    DateFormat.yMMMd()
                        .format(DateTime.parse(list[index].releaseDate)),
                    style: releaseTimeStyle,
                  )),
            ]),
          )));
}

// NavBarWidget
SizedBox buildNavBarWidget() {
  return SizedBox(
    height: 8.h,
    child: GNav(
        gap: 10,
        backgroundColor: Colors.black45,
        color: Colors.white,
        activeColor: Colors.white,
        rippleColor: Colors.grey,
        tabActiveBorder: Border.all(color: Colors.white38),
        tabBackgroundColor: Colors.grey.shade900,
        tabBorderRadius: 50,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        padding: const EdgeInsets.all(10),
        tabs: const [
          GButton(
            icon: FontAwesomeIcons.house,
            text: 'Home',
          ),
          GButton(
            icon: FontAwesomeIcons.heart,
            text: 'like',
          ),
          GButton(
            icon: FontAwesomeIcons.magnifyingGlass,
            text: 'Search',
          ),
          GButton(
            icon: FontAwesomeIcons.person,
            text: 'Profile',
          ),
        ]),
  );
}

// Title Widget
SizedBox buildTitleWidget(String title) {
  return SizedBox(
    width: 30.w,
    child: Text(
      title,
      style: titleStyle,
    ),
  );
}

//Digital Clock Widget
Container digitalClockWidget({required String time}) {
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
            color: Colors.white, fontSize: 70.sp, fontWeight: FontWeight.w700),
      ),
    ),
  );
}
