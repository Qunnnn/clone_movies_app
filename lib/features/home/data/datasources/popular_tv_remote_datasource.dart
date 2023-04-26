import '../../../../constants/api_path.dart';
import '../models/popular_tv_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../../core/error/exceptions.dart';


abstract class PopularTvRemoteDataSoure {
  Future<List<PopularTvModel>> getPopularTv();
}

class PopularTvRemoteDataSoureIml implements PopularTvRemoteDataSoure {

  @override
  Future<List<PopularTvModel>> getPopularTv() async {
    List<PopularTvModel> results = [];
    var url =
        Uri.parse("$baseUrl/tv/popular?api_key=$apiKey");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var movies = jsonDecode(response.body)["results"];
      for (var movie in movies) {
        results.add(PopularTvModel.fromJson(movie));
      }
    } else {
      throw ServerException();
    }
    return results;
  }
}
