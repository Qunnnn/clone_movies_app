import 'package:clone_movies_app/features/details/details.dart';
import 'package:clone_movies_app/features/details/presentation/bloc/trailer_bloc/trailer_bloc.dart';
import 'package:clone_movies_app/features/home/home.dart';
import 'package:clone_movies_app/features/intro/intro.dart';
import 'package:clone_movies_app/features/main/presentation/bloc/bloc.dart';
import 'package:clone_movies_app/shared/core/network/manager/network_manager.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl
    //Intro
    ..registerFactory<UpComingMovieBloc>(
        () => UpComingMovieBloc(getUpComingMovie: sl()))
    ..registerLazySingleton<GetUpComingMovie>(
        () => GetUpComingMovie(repository: sl()))
    ..registerLazySingleton<UpComingRepository>(
        () => UpComingMovieRepositoryIml(remoteDataSource: sl()))
    ..registerLazySingleton<RemoteDataSource>(
        () => RemoteDataSourceIml(netWorkManager: sl()))
    ..registerLazySingleton<NetworkManager>(() => NetWorkManagerIml());

  sl
    //Main
    ..registerFactory<MainPageBloc>(() => MainPageBloc());

  sl
    //Home
    ..registerFactory<PopularTvBloc>(() => PopularTvBloc(getPopularTv: sl()))
    ..registerLazySingleton<GetPopularTv>(
        () => GetPopularTv(popularTvRepo: sl()))
    ..registerLazySingleton<PopularTvRepo>(
        () => PopularTvRepoIml(popularTvRemoteDataSoure: sl()))
    ..registerLazySingleton<PopularTvRemoteDataSoure>(
        () => PopularTvRemoteDataSoureIml(networkManager: sl()))
    ..registerFactory<TopRatedMovieBloc>(
        () => TopRatedMovieBloc(getTopRatedMovie: sl()))
    ..registerLazySingleton<GetTopRatedMovie>(
        () => GetTopRatedMovie(topRatedMovieRepository: sl()))
    ..registerLazySingleton<TopRatedMovieRepository>(
        () => TopRatedRepositoryIml(topRatedMovieRemoteDataSoure: sl()))
    ..registerLazySingleton<TopRatedMovieRemoteDataSoure>(
        () => TopRatedMovieRemoteDataSoureIml(networkManager: sl()))
    ..registerFactory<TrendingMovieBloc>(
        () => TrendingMovieBloc(getTrendingMovie: sl()))
    ..registerLazySingleton<GetTrendingMovie>(
        () => GetTrendingMovie(trendingMovieRepository: sl()))
    ..registerLazySingleton<TrendingMovieRepository>(
        () => TrendingMovieRepositoryIml(trendingMovieRemoteDataSoure: sl()))
    ..registerLazySingleton<TrendingMovieRemoteDataSoure>(
        () => TrendingMovieRemoteDataSoureIml(networkManager: sl()));

  sl
    //Detail
    ..registerFactory<DetailsBloc>(() => DetailsBloc(getDetails: sl()))
    ..registerLazySingleton<GetDetails>(() => GetDetails(detailsRepo: sl()))
    ..registerLazySingleton<DetailsRepo>(
        () => DetailsRepoIml(detailsRemoteDataSource: sl()))
    ..registerLazySingleton<DetailsRemoteDataSource>(
        () => DetailsRemoteDataSourceIml(networkManager: sl()))
    ..registerFactory<CastBloc>(() => CastBloc(getCasts: sl()))
    ..registerLazySingleton<GetCasts>(() => GetCasts(castRepo: sl()))
    ..registerLazySingleton<CastRepo>(
        () => CastRepoIml(castRemoteDataSource: sl()))
    ..registerLazySingleton<CastRemoteDataSource>(
        () => CastRemoteDataSourceIml(networkManager: sl()))
    ..registerFactory<TrailerBloc>(() => TrailerBloc(getTrailer: sl()))
    ..registerLazySingleton<GetTrailer>(() => GetTrailer(trailerRepo: sl()))
    ..registerLazySingleton<TrailerRepo>(
        () => TrailerRepoIml(trailerRemoteDataSource: sl()))
    ..registerLazySingleton<TrailerRemoteDataSource>(
        () => TrailerRemoteDataSourceIml(networkManager: sl()));
}
