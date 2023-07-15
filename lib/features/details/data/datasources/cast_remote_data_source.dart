import 'package:clone_movies_app/shared/core/network/manager/network_manager.dart';
import '../models/cast_model.dart';

abstract class CastRemoteDataSource {
  Future<List<CastModel>> getCast({required int id});
}

class CastRemoteDataSourceIml implements CastRemoteDataSource {
  NetworkManager networkManager;
  CastRemoteDataSourceIml({required this.networkManager});
  @override
  Future<List<CastModel>> getCast({required int id}) async {
    return await networkManager.fetchCastData(id: id);
  }
}
