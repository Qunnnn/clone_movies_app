import 'package:clone_movies_app/core/appBlocs/app_bloc_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'features/intro/presentation/pages/IntroPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppBlocProviders.homeBlocProviders,
      child: Sizer(
        builder: (context, orientation, deviceType) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Clone movie application',
          theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Dongle' , useMaterial3: true),
          home: const IntroPage(),
        ),
      ),
    );
  }
}
