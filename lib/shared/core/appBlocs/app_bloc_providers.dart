import 'package:clone_movies_app/features/details/details.dart';
import 'package:clone_movies_app/features/main/presentation/bloc/bloc.dart';
import 'package:clone_movies_app/features/search/presentation/bloc/search_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../features/home/presentation/bloc/bloc.dart';
import '../../../features/intro/presentation/bloc/intro_bloc.dart';
import '../../../injection_container.dart';

class AppBlocProviders {
  static get homeBlocProviders => [
        BlocProvider(
          create: (context) => sl<MainPageBloc>(),
        ),
        BlocProvider(create: (context) => sl<IntroBloc>()),
        BlocProvider(create: (context) => sl<TrendingMovieBloc>()),
        BlocProvider(create: (context) => sl<PopularTvBloc>()),
        BlocProvider(create: (context) => sl<TopRatedMovieBloc>()),
        BlocProvider(
          create: (context) => DetailsBloc(),
        ),
        BlocProvider(
          create: (context) => CastBloc(),
        ),
        BlocProvider(create: (context) => SearchBloc(),),
      ];
}
