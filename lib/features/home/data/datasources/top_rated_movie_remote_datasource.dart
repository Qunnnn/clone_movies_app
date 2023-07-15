import 'package:clone_movies_app/shared/core/network/manager/network_manager.dart';
import '../models/top_rated_movie_model.dart';

abstract class TopRatedMovieRemoteDataSoure {
  Future<List<TopRatedMovieModel>> getTopRatedMovie();
}

class TopRatedMovieRemoteDataSoureIml implements TopRatedMovieRemoteDataSoure {
  NetworkManager networkManager;
  TopRatedMovieRemoteDataSoureIml({required this.networkManager});
  @override
  Future<List<TopRatedMovieModel>> getTopRatedMovie() async {
    return await networkManager.fetchTopRatedMovieData();
  }
}
