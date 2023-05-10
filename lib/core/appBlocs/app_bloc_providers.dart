import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/details/presentation/bloc/details_bloc.dart';
import '../../features/home/presentation/bloc/home_bloc_injection.dart';
import '../../features/intro/presentation/bloc/intro_bloc.dart';

class AppBlocProviders {
  static get homeBlocProviders => [
        BlocProvider(create: (context) => IntroBloc()),
        BlocProvider(create: (context) => TrendingMovieBloc()),
        BlocProvider(create: (context) => PopularTvBloc()),
        BlocProvider(create: (context) => TopRatedMovieBloc()),
        BlocProvider(
          create: (context) => DetailsBloc(),
        )
      ];
}
