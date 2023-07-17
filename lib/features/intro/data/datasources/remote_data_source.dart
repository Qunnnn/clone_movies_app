import 'package:clone_movies_app/shared/core/network/manager/network_manager.dart';
import '../models/models.dart';

abstract class RemoteDataSource {
  Future<List<PosterModel>> getUpcomingMovie();
}

class RemoteDataSourceIml implements RemoteDataSource {
  NetworkManager netWorkManager;
  RemoteDataSourceIml({required this.netWorkManager});
  @override
  Future<List<PosterModel>> getUpcomingMovie() async {
    return await netWorkManager.fetchUpcomingMovie();
  }
}
