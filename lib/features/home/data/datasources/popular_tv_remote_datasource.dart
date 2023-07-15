import 'package:clone_movies_app/shared/core/network/manager/network_manager.dart';

import '../../../../shared/constants/api_path.dart';
import '../models/popular_tv_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../../shared/core/error/exceptions.dart';

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
