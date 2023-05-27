import 'package:clone_movies_app/config/routes/routes_handler.dart';
import 'package:clone_movies_app/core/appBlocs/app_bloc_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppPages.getStatusLogin();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppBlocProviders.homeBlocProviders,
      child: Sizer(
        builder: (context, orientation, deviceType) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Clone movie application',
          theme: ThemeData(
              primarySwatch: Colors.blue,
              fontFamily: 'Dongle',
              useMaterial3: true),
          onGenerateRoute: AppPages.generateRouteSettings,
        ),
      ),
    );
  }
}
