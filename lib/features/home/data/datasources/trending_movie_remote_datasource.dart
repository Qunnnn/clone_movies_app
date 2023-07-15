import 'package:clone_movies_app/shared/core/network/manager/network_manager.dart';
import '../models/trending_movie_model.dart';

abstract class TrendingMovieRemoteDataSoure {
  Future<List<TrendingMovieModel>> getTrendingMovie(
      {required String timeWindow});
}

class TrendingMovieRemoteDataSoureIml implements TrendingMovieRemoteDataSoure {
  NetworkManager networkManager;
  TrendingMovieRemoteDataSoureIml({required this.networkManager});
  @override
  Future<List<TrendingMovieModel>> getTrendingMovie(
      {required String timeWindow}) async {
    return await networkManager.fetchTrendingMovieData(timeWindow: timeWindow);
  }
}
