import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'features/intro/presentation/bloc/intro_bloc.dart';
import 'features/intro/presentation/pages/IntroPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Clone movie application',
        theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Dongle'),
        home: BlocProvider(
          create: (context) => IntroBloc()..add(IntroEvent()),
          child: const IntroPage(),
        ),
      ),
    );
  }
}
