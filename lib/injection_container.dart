import 'package:clone_movies_app/features/intro/intro.dart';
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

  //
}
