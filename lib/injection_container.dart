import 'package:clone_movies_app/features/home/home.dart';
import 'package:clone_movies_app/features/intro/intro.dart';
import 'package:clone_movies_app/features/main/presentation/bloc/bloc.dart';
import 'package:clone_movies_app/shared/core/network/manager/network_manager.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //Intro
  sl.registerFactory<IntroBloc>(() => IntroBloc(getBackdropIntro: sl()));

  sl.registerLazySingleton<GetBackdropIntro>(
      () => GetBackdropIntro(repository: sl()));

  sl.registerLazySingleton<BackdropRepository>(
      () => IntroRepositoryIml(remoteDataSource: sl()));

  sl.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceIml(netWorkManager: sl()));

  sl.registerLazySingleton<NetworkManager>(() => NetWorkManagerIml());

  //Main
  sl.registerFactory<MainPageBloc>(() => MainPageBloc());

  //Home
  sl.registerFactory<PopularTvBloc>(() => PopularTvBloc(getPopularTv: sl()));

  sl.registerLazySingleton<GetPopularTv>(
      () => GetPopularTv(popularTvRepo: sl()));

  sl.registerLazySingleton<PopularTvRepo>(
      () => PopularTvRepoIml(popularTvRemoteDataSoure: sl()));

  sl.registerLazySingleton<PopularTvRemoteDataSoure>(
      () => PopularTvRemoteDataSoureIml(networkManager: sl()));

  sl.registerFactory<TopRatedMovieBloc>(
      () => TopRatedMovieBloc(getTopRatedMovie: sl()));

  sl.registerLazySingleton<GetTopRatedMovie>(
      () => GetTopRatedMovie(topRatedMovieRepository: sl()));

  sl.registerLazySingleton<TopRatedMovieRepository>(
      () => TopRatedRepositoryIml(topRatedMovieRemoteDataSoure: sl()));

  sl.registerLazySingleton<TopRatedMovieRemoteDataSoure>(
      () => TopRatedMovieRemoteDataSoureIml(networkManager: sl()));

  sl.registerFactory<TrendingMovieBloc>(
      () => TrendingMovieBloc(getTrendingMovie: sl()));

  sl.registerLazySingleton<GetTrendingMovie>(
      () => GetTrendingMovie(trendingMovieRepository: sl()));

  sl.registerLazySingleton<TrendingMovieRepository>(() => TrendingMovieRepositoryIml(trendingMovieRemoteDataSoure: sl()));   

  sl.registerLazySingleton<TrendingMovieRemoteDataSoure>(() =>  TrendingMovieRemoteDataSoureIml(networkManager: sl())); 
}
