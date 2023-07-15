import 'package:clone_movies_app/shared/core/network/manager/network_manager.dart';
import '../models/details_model.dart';

abstract class DetailsRemoteDataSource {
  Future<DetailsModel> getDetails({required int id});
}

class DetailsRemoteDataSourceIml implements DetailsRemoteDataSource {
  NetworkManager networkManager;
  DetailsRemoteDataSourceIml({required this.networkManager});
  @override
  Future<DetailsModel> getDetails({required int id}) async {
    return await networkManager.fetchDetailsData(id: id);
  }
}
