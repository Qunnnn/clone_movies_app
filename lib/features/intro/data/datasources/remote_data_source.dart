import 'package:clone_movies_app/shared/core/network/manager/network_manager.dart';
import '../models/models.dart';

abstract class RemoteDataSource {
  Future<List<PosterModel>> getPosters();
}

class RemoteDataSourceIml implements RemoteDataSource {
  NetworkManager netWorkManager;
  RemoteDataSourceIml({required this.netWorkManager});
  @override
  Future<List<PosterModel>> getPosters() async {
    return await netWorkManager.fetchIntroPoster();
  }
}
