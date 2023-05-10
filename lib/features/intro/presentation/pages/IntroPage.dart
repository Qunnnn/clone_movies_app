import 'package:clone_movies_app/constants/app_constants.dart';
import 'package:clone_movies_app/core/appBlocs/app_bloc_providers.dart';
import '../../../../constants/assest_path.dart';
import '../../../details/presentation/bloc/details_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../../home/presentation/bloc/home_bloc_injection.dart';
import '../../../home/presentation/pages/home_page.dart';
import 'background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/intro_bloc.dart';
import '../widgets/intro_widget.dart';
import 'dart:math';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: BlocBuilder<IntroBloc, PosterState>(
          builder: (context, state) {
            if (state is LoadingPosterState) {
              return SpinKitFadingCircle(
                color: Colors.white,
                size: 10.h,
              );
            }
            if (state is LoadedIntroState) {
              return Stack(
                children: [
                  Positioned(
                      top: -10,
                      left: -90,
                      child: Background(list: state.results)),
                  Positioned(
                    top: 2.h,
                    right: 10.w,
                    left: 10.w,
                    child: SvgPicture.network(
                      netFlixLogo,
                    ),
                  ),
                  Positioned(
                      bottom: 6.h,
                      right: 10.w,
                      left: 10.w,
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            MyTextField(
                                controller: emailController,
                                hintText: 'Email',
                                icon: FontAwesomeIcons.person,
                                obscureText: false,
                                context: context),
                            SizedBox(
                              height: 2.h,
                            ),
                            MyTextField(
                                controller: passwordController,
                                hintText: 'Password',
                                icon: FontAwesomeIcons.key,
                                obscureText: true,
                                context: context),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                'forget Password',
                                style: forgetPasswordStyle,
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            LoginButton(onTap: () {
                              if (_formKey.currentState!.validate()) {
                                if (emailController.text == 'admin@gmail.com' &&
                                    passwordController.text == "20092001") {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => MultiBlocProvider(
                                        providers:
                                            AppBlocProviders.homeBlocProviders,
                                        child: HomePage(
                                          welcomeImage: state
                                              .results[Random().nextInt(
                                                  state.results.length)]
                                              .backdropPath,
                                        ),
                                      ),
                                    ),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Invalid ')),
                                  );
                                }
                              }
                            }),
                          ],
                        ),
                      )),
                ],
              );
            }
            return Container();
          },
        ));
  }
}
