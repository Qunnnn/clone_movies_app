import 'package:clone_movies_app/core/appBlocs/app_bloc_providers.dart';
import 'package:clone_movies_app/features/home/home.dart';
import 'package:clone_movies_app/service/local_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'features/intro/presentation/pages/IntroPage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocalStorageService localStorageService = LocalStorageService();
  bool statusLogin = await localStorageService.readStatus(key: 'statusLogin') ?? false;
  runApp(MyApp(
    statusLogin: statusLogin,
  ));
}

class MyApp extends StatelessWidget {
  bool? statusLogin;
  MyApp({super.key, required this.statusLogin});

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
          home: statusLogin == true ? const HomePage() : const IntroPage(),
      
        ),
      ),
    );
  }
}
