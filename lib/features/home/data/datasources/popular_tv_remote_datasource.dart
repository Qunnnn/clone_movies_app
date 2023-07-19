import 'package:clone_movies_app/shared/core/network/manager/network_manager.dart';
import '../models/popular_tv_model.dart';

abstract class PopularTvRemoteDataSoure {
  Future<List<PopularTvModel>> getPopularTv();
}

class PopularTvRemoteDataSoureIml implements PopularTvRemoteDataSoure {
  NetworkManager networkManager;
  PopularTvRemoteDataSoureIml({required this.networkManager});
  @override
  Future<List<PopularTvModel>> getPopularTv() async {
    return await networkManager.fetchPopularTvData();
  }
}
