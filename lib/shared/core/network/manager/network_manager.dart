import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../features/home/data/data.dart';
import '../../../../features/intro/data/models/poster_model.dart';
import '../../../constants/constants.dart';
import '../../error/exceptions.dart';

abstract class NetworkManager {
  Future<List<PosterModel>> fetchIntroPoster();
  Future<List<PopularTvModel>> fetchPopularTvData();
  Future<List<TopRatedMovieModel>> fetchTopRatedMovieData();
}

class NetWorkManagerIml implements NetworkManager {
  @override
  Future<List<PosterModel>> fetchIntroPoster() async {
    List<PosterModel> results = [];
    var url = Uri.parse("$baseUrl/movie/upcoming?api_key=$apiKey");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var posters = jsonDecode(response.body)["results"];
      for (var poster in posters) {
        results.add(PosterModel.fromJson(poster));
      }
    } else {
      throw ServerException();
    }
    return results;
  }

  @override
  Future<List<PopularTvModel>> fetchPopularTvData() async {
    List<PopularTvModel> results = [];
    var url = Uri.parse("$baseUrl/tv/popular?api_key=$apiKey");
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
  
  @override
  Future<List<TopRatedMovieModel>> fetchTopRatedMovieData() async {
    List<TopRatedMovieModel> results = [];
    var url =
        Uri.parse("$baseUrl/movie/top_rated?api_key=$apiKey");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var movies = jsonDecode(response.body)["results"];
      for (var movie in movies) {
        results.add(TopRatedMovieModel.fromJson(movie));
      }
    } else {
      throw ServerException();
    }
    return results;
  }
}
