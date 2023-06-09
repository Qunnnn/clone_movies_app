import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: const Welcome(),
      drawer: drawerWidget(context),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xff2A2F4F),
                      Color(0xff393646),
                      Color(0xff393646),
                      Color(0xff7B8FA1),
                    ],
                  ),
                ),
                child: Column(
                  children: [
                    const TrendingMovie(),
                    const TopRatedMovie(),
                    const PopularTv(),
                    SizedBox(
                      height: 5.h,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
