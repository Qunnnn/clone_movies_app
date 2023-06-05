import 'package:clone_movies_app/config/routes/routes_config.dart';
import 'package:clone_movies_app/constants/app_constants.dart';
import 'package:clone_movies_app/features/home/home.dart';
import 'package:clone_movies_app/features/intro/intro.dart';
import 'package:clone_movies_app/utils/services/local_storage_service.dart';
import 'package:flutter/material.dart';

class AppPages {
  static late bool isLoggedIn;
   static getStatusLogin() async {
    LocalStorageService localStorageService = LocalStorageService();
    isLoggedIn =
        await localStorageService.readStatus(key: statusLoginKey) ?? false;
  }

  static List<PageEntity> routes = [
    PageEntity(
      route: AppRoutes.Initial,
      page: const IntroPage(),
    ),
    PageEntity(
      route: AppRoutes.HomePage,
      page: const HomePage(),
    ),
    PageEntity(route: AppRoutes.SchedulePage, page: const SchedulePage()),
  ];

  static MaterialPageRoute generateRouteSettings(RouteSettings routeSettings) {
    if (routeSettings.name != null) {
      var result =
          routes.where((element) => element.route == routeSettings.name);
      if (result.isNotEmpty) {
        if (isLoggedIn && result.first.route == '/') {
          return MaterialPageRoute(
            builder: (context) => const HomePage(),
          );
        }
        return MaterialPageRoute(
          builder: (context) => result.first.page,
          settings: routeSettings,
        );
      }
    }
    return MaterialPageRoute(
        builder: (context) => const IntroPage(), settings: routeSettings);
  }
}

class PageEntity {
  String route;
  Widget page;
  PageEntity({required this.route, required this.page});
}
