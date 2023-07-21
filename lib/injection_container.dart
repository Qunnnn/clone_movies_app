import 'package:clone_movies_app/features/details/details.dart';
import 'package:clone_movies_app/features/details/presentation/bloc/trailer_bloc/trailer_bloc.dart';
import 'package:clone_movies_app/features/home/home.dart';
import 'package:clone_movies_app/features/intro/intro.dart';
import 'package:clone_movies_app/features/main/presentation/bloc/bloc.dart';
import 'package:clone_movies_app/shared/core/network/manager/network_manager.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //Intro
  sl.registerFactory<UpComingMovieBloc>(
      () => UpComingMovieBloc(getUpComingMovie: sl()));

  sl.registerLazySingleton<GetUpComingMovie>(
      () => GetUpComingMovie(repository: sl()));

  sl.registerLazySingleton<UpComingRepository>(
      () => UpComingMovieRepositoryIml(remoteDataSource: sl()));

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

  sl.registerLazySingleton<TrendingMovieRepository>(
      () => TrendingMovieRepositoryIml(trendingMovieRemoteDataSoure: sl()));

  sl.registerLazySingleton<TrendingMovieRemoteDataSoure>(
      () => TrendingMovieRemoteDataSoureIml(networkManager: sl()));

  //Detail

  sl.registerFactory<DetailsBloc>(() => DetailsBloc(getDetails: sl()));

  sl.registerLazySingleton<GetDetails>(() => GetDetails(detailsRepo: sl()));

  sl.registerLazySingleton<DetailsRepo>(
      () => DetailsRepoIml(detailsRemoteDataSource: sl()));

  sl.registerLazySingleton<DetailsRemoteDataSource>(
      () => DetailsRemoteDataSourceIml(networkManager: sl()));

  sl.registerFactory<CastBloc>(() => CastBloc(getCasts: sl()));

  sl.registerLazySingleton<GetCasts>(() => GetCasts(castRepo: sl()));

  sl.registerLazySingleton<CastRepo>(
      () => CastRepoIml(castRemoteDataSource: sl()));

  sl.registerLazySingleton<CastRemoteDataSource>(
      () => CastRemoteDataSourceIml(networkManager: sl()));

  sl.registerFactory<TrailerBloc>(() => TrailerBloc(getTrailer: sl()));

  sl.registerLazySingleton<GetTrailer>(() => GetTrailer(trailerRepo: sl()));

  sl.registerLazySingleton<TrailerRepo>(() => TrailerRepoIml(trailerRemoteDataSource: sl()));

  sl.registerLazySingleton<TrailerRemoteDataSource>(() => TrailerRemoteDataSourceIml(networkManager: sl()));
}
