import 'package:clone_movies_app/features/details/details.dart';
import 'package:clone_movies_app/shared/core/network/manager/network_manager.dart';

abstract class TrailerRemoteDataSource {
  Future<TrailerModel> fetchTrailer({required int id});
}

class TrailerRemoteDataSourceIml implements TrailerRemoteDataSource {
  final NetworkManager networkManager;
  const TrailerRemoteDataSourceIml({required this.networkManager});

  @override
  Future<TrailerModel> fetchTrailer({required int id}) async{
    return await networkManager.fetchTrailer(id: id);
  }
}
